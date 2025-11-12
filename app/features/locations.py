from flask import Blueprint, render_template, request, redirect, url_for, flash
from flask_login import login_required, current_user
from datetime import datetime
from app.db.models import db, Location, Warehouse, Item
from app.core.audit import add_audit_fields

locations_bp = Blueprint('locations', __name__)

@locations_bp.route('/')
@login_required
def list_locations():
    warehouse_id = request.args.get('warehouse_id', type=int)
    query = Location.query
    if warehouse_id:
        query = query.filter_by(warehouse_id=warehouse_id)
    locations = query.order_by(Location.aisle_no, Location.bin_no).all()
    warehouses = Warehouse.query.filter_by(status_code='A').all()
    return render_template('locations/index.html', locations=locations, warehouses=warehouses, selected_warehouse=warehouse_id)

@locations_bp.route('/create', methods=['GET', 'POST'])
@login_required
def create():
    if request.method == 'POST':
        warehouse_id = request.form.get('warehouse_id', type=int)
        item_id = request.form.get('item_id', type=int)
        aisle_no = request.form.get('aisle_no', '').strip()
        bin_no = request.form.get('bin_no', '').strip()
        qty = float(request.form.get('qty', 0))
        
        if not warehouse_id or not item_id:
            flash('Please select warehouse and item.', 'danger')
            return render_template('locations/create.html', 
                warehouses=Warehouse.query.filter_by(status_code='A').all(),
                items=Item.query.filter_by(status_code='A').all())
        
        new_location = Location(
            warehouse_id=warehouse_id,
            item_id=item_id,
            aisle_no=aisle_no,
            bin_no=bin_no,
            qty=qty,
            status_code='A'
        )
        
        add_audit_fields(new_location, current_user.email)
        
        db.session.add(new_location)
        db.session.commit()
        
        flash('Location created successfully.', 'success')
        return redirect(url_for('locations.list_locations'))
    
    warehouses = Warehouse.query.filter_by(status_code='A').all()
    items = Item.query.filter_by(status_code='A').all()
    return render_template('locations/create.html', warehouses=warehouses, items=items)
