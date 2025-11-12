from flask import Blueprint, render_template, request, redirect, url_for, flash
from flask_login import login_required, current_user
from app.db.models import db, Fulfilment, FulfilmentLineItem, FulfilmentEditLog, NeedsList, NeedsListItem, Warehouse, Inventory
from app.core.status import get_status_badge_class, get_status_label
from datetime import datetime
from decimal import Decimal

fulfilment_bp = Blueprint('fulfilment', __name__)

@fulfilment_bp.route('/')
@login_required
def index():
    fulfilments = Fulfilment.query.order_by(Fulfilment.created_at.desc()).all()
    return render_template('fulfilment/index.html', fulfilments=fulfilments)

@fulfilment_bp.route('/create_from_needs_list/<int:needs_list_id>', methods=['GET', 'POST'])
@login_required
def create_from_needs_list(needs_list_id):
    needs_list = NeedsList.query.get_or_404(needs_list_id)
    
    if needs_list.status != 'Approved':
        flash('Only approved needs lists can be fulfilled', 'warning')
        return redirect(url_for('needs_list.view', needs_list_id=needs_list_id))
    
    if request.method == 'POST':
        try:
            latest_fulfilment = Fulfilment.query.order_by(Fulfilment.id.desc()).first()
            next_id = (latest_fulfilment.id + 1) if latest_fulfilment else 1
            fulfilment_number = f"FUL{next_id:06d}"
            
            fulfilment = Fulfilment(
                needs_list_id=needs_list.id,
                fulfilment_number=fulfilment_number,
                status='In Preparation',
                is_partial=request.form.get('is_partial') == 'on',
                notes=request.form.get('notes')
            )
            
            db.session.add(fulfilment)
            db.session.flush()
            
            line_count = 0
            for needs_item in needs_list.items:
                qty_key = f'item_{needs_item.id}_qty'
                warehouse_key = f'item_{needs_item.id}_warehouse'
                
                if qty_key in request.form and warehouse_key in request.form:
                    qty = request.form.get(qty_key)
                    warehouse_id = request.form.get(warehouse_key)
                    
                    if qty and float(qty) > 0 and warehouse_id:
                        line_item = FulfilmentLineItem(
                            fulfilment_id=fulfilment.id,
                            source_warehouse_id=int(warehouse_id),
                            item_id=needs_item.item_id,
                            allocated_qty=Decimal(qty),
                            notes=request.form.get(f'item_{needs_item.id}_notes', '')
                        )
                        db.session.add(line_item)
                        line_count += 1
            
            if line_count == 0:
                flash('Please allocate at least one item for fulfilment', 'danger')
                db.session.rollback()
                warehouses = Warehouse.query.filter_by(status_code='A').order_by(Warehouse.warehouse_name).all()
                return render_template('fulfilment/create_from_needs_list.html', 
                                     needs_list=needs_list, warehouses=warehouses)
            
            needs_list.status = 'In Fulfilment'
            needs_list.updated_at = datetime.now()
            
            db.session.commit()
            flash(f'Fulfilment {fulfilment_number} created successfully with {line_count} line items', 'success')
            return redirect(url_for('fulfilment.view', fulfilment_id=fulfilment.id))
            
        except Exception as e:
            db.session.rollback()
            flash(f'Error creating fulfilment: {str(e)}', 'danger')
    
    warehouses = Warehouse.query.filter_by(status_code='A').order_by(Warehouse.warehouse_name).all()
    return render_template('fulfilment/create_from_needs_list.html', 
                         needs_list=needs_list, warehouses=warehouses)

@fulfilment_bp.route('/<int:fulfilment_id>')
@login_required
def view(fulfilment_id):
    fulfilment = Fulfilment.query.get_or_404(fulfilment_id)
    return render_template('fulfilment/view.html', fulfilment=fulfilment)

@fulfilment_bp.route('/<int:fulfilment_id>/mark_ready', methods=['POST'])
@login_required
def mark_ready(fulfilment_id):
    fulfilment = Fulfilment.query.get_or_404(fulfilment_id)
    
    if fulfilment.status != 'In Preparation':
        flash('Only fulfilments in preparation can be marked as ready', 'warning')
        return redirect(url_for('fulfilment.view', fulfilment_id=fulfilment_id))
    
    try:
        fulfilment.status = 'Ready'
        fulfilment.prepared_by = current_user.email
        fulfilment.prepared_at = datetime.now()
        fulfilment.updated_at = datetime.now()
        
        db.session.commit()
        flash(f'Fulfilment {fulfilment.fulfilment_number} marked as ready', 'success')
        
    except Exception as e:
        db.session.rollback()
        flash(f'Error marking fulfilment as ready: {str(e)}', 'danger')
    
    return redirect(url_for('fulfilment.view', fulfilment_id=fulfilment_id))

@fulfilment_bp.route('/<int:fulfilment_id>/dispatch', methods=['POST'])
@login_required
def dispatch(fulfilment_id):
    fulfilment = Fulfilment.query.get_or_404(fulfilment_id)
    
    if fulfilment.status != 'Ready':
        flash('Only ready fulfilments can be dispatched', 'warning')
        return redirect(url_for('fulfilment.view', fulfilment_id=fulfilment_id))
    
    try:
        for line_item in fulfilment.line_items:
            line_item.dispatched_qty = line_item.allocated_qty
            line_item.status = 'Dispatched'
        
        fulfilment.status = 'Dispatched'
        fulfilment.dispatched_by = current_user.email
        fulfilment.dispatched_at = datetime.now()
        fulfilment.updated_at = datetime.now()
        
        db.session.commit()
        flash(f'Fulfilment {fulfilment.fulfilment_number} dispatched successfully', 'success')
        
    except Exception as e:
        db.session.rollback()
        flash(f'Error dispatching fulfilment: {str(e)}', 'danger')
    
    return redirect(url_for('fulfilment.view', fulfilment_id=fulfilment_id))

@fulfilment_bp.route('/<int:fulfilment_id>/confirm_receipt', methods=['POST'])
@login_required
def confirm_receipt(fulfilment_id):
    fulfilment = Fulfilment.query.get_or_404(fulfilment_id)
    
    if fulfilment.status != 'Dispatched':
        flash('Only dispatched fulfilments can be received', 'warning')
        return redirect(url_for('fulfilment.view', fulfilment_id=fulfilment_id))
    
    try:
        for line_item in fulfilment.line_items:
            line_item.received_qty = line_item.dispatched_qty
            line_item.status = 'Received'
        
        fulfilment.status = 'Received'
        fulfilment.received_by = current_user.email
        fulfilment.received_at = datetime.now()
        fulfilment.updated_at = datetime.now()
        
        db.session.commit()
        flash(f'Fulfilment {fulfilment.fulfilment_number} received successfully', 'success')
        
    except Exception as e:
        db.session.rollback()
        flash(f'Error confirming receipt: {str(e)}', 'danger')
    
    return redirect(url_for('fulfilment.view', fulfilment_id=fulfilment_id))

@fulfilment_bp.route('/<int:fulfilment_id>/complete', methods=['POST'])
@login_required
def complete(fulfilment_id):
    fulfilment = Fulfilment.query.get_or_404(fulfilment_id)
    
    if fulfilment.status != 'Received':
        flash('Only received fulfilments can be completed', 'warning')
        return redirect(url_for('fulfilment.view', fulfilment_id=fulfilment_id))
    
    try:
        fulfilment.status = 'Completed'
        fulfilment.updated_at = datetime.now()
        
        for item in fulfilment.needs_list.items:
            item.fulfilled_qty = item.approved_qty
            item.status = 'Fulfilled'
        
        fulfilment.needs_list.status = 'Completed'
        fulfilment.needs_list.updated_at = datetime.now()
        
        db.session.commit()
        flash(f'Fulfilment {fulfilment.fulfilment_number} completed successfully', 'success')
        
    except Exception as e:
        db.session.rollback()
        flash(f'Error completing fulfilment: {str(e)}', 'danger')
    
    return redirect(url_for('fulfilment.view', fulfilment_id=fulfilment_id))
