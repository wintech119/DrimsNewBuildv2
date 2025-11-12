from flask import Blueprint, render_template, request, redirect, url_for, flash
from flask_login import login_required, current_user
from app.db.models import db, DispatchManifest, Fulfilment, Warehouse
from datetime import datetime

dispatch_bp = Blueprint('dispatch', __name__)

@dispatch_bp.route('/')
@login_required
def index():
    manifests = DispatchManifest.query.order_by(DispatchManifest.dispatched_at.desc()).all()
    return render_template('dispatch/index.html', manifests=manifests)

@dispatch_bp.route('/create_from_fulfilment/<int:fulfilment_id>', methods=['GET', 'POST'])
@login_required
def create_from_fulfilment(fulfilment_id):
    fulfilment = Fulfilment.query.get_or_404(fulfilment_id)
    
    if fulfilment.status != 'Ready':
        flash('Only ready fulfilments can have dispatch manifests created', 'warning')
        return redirect(url_for('fulfilment.view', fulfilment_id=fulfilment_id))
    
    if request.method == 'POST':
        try:
            latest_manifest = DispatchManifest.query.order_by(DispatchManifest.id.desc()).first()
            next_id = (latest_manifest.id + 1) if latest_manifest else 1
            manifest_number = f"DM{next_id:06d}"
            
            from_warehouse_id = int(request.form['from_warehouse_id'])
            to_warehouse_id = int(request.form['to_warehouse_id'])
            
            if from_warehouse_id == to_warehouse_id:
                flash('Source and destination warehouses must be different', 'danger')
                warehouses = Warehouse.query.filter_by(status_code='A').order_by(Warehouse.warehouse_name).all()
                return render_template('dispatch/create_from_fulfilment.html', 
                                     fulfilment=fulfilment, warehouses=warehouses)
            
            manifest = DispatchManifest(
                fulfilment_id=fulfilment.id,
                manifest_number=manifest_number,
                from_warehouse_id=from_warehouse_id,
                to_warehouse_id=to_warehouse_id,
                vehicle_info=request.form.get('vehicle_info'),
                driver_name=request.form.get('driver_name'),
                driver_contact=request.form.get('driver_contact'),
                dispatch_notes=request.form.get('dispatch_notes'),
                dispatched_by=current_user.email,
                dispatched_at=datetime.now()
            )
            
            db.session.add(manifest)
            db.session.commit()
            
            flash(f'Dispatch manifest {manifest_number} created successfully', 'success')
            return redirect(url_for('dispatch.view', manifest_id=manifest.id))
            
        except Exception as e:
            db.session.rollback()
            flash(f'Error creating dispatch manifest: {str(e)}', 'danger')
    
    warehouses = Warehouse.query.filter_by(status_code='A').order_by(Warehouse.warehouse_name).all()
    return render_template('dispatch/create_from_fulfilment.html', 
                         fulfilment=fulfilment, warehouses=warehouses)

@dispatch_bp.route('/<int:manifest_id>')
@login_required
def view(manifest_id):
    manifest = DispatchManifest.query.get_or_404(manifest_id)
    return render_template('dispatch/view.html', manifest=manifest)
