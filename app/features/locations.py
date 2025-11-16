from flask import Blueprint, render_template, request, redirect, url_for, flash
from flask_login import login_required, current_user
from datetime import datetime
from app.db.models import db, Location, Warehouse, Inventory
from app.core.audit import add_audit_fields

locations_bp = Blueprint('locations', __name__)

@locations_bp.route('/')
@login_required
def list_locations():
    inventory_id = request.args.get('inventory_id', type=int)
    query = Location.query.join(Inventory)
    if inventory_id:
        query = query.filter(Location.inventory_id == inventory_id)
    locations = query.order_by(Location.location_desc).all()
    inventories = db.session.query(Inventory).join(Warehouse).filter(Warehouse.status_code == 'A').all()
    return render_template('locations/index.html', locations=locations, inventories=inventories, selected_inventory=inventory_id)

@locations_bp.route('/create', methods=['GET', 'POST'])
@login_required
def create():
    if request.method == 'POST':
        inventory_id = request.form.get('inventory_id', type=int)
        location_desc = request.form.get('location_desc', '').strip()
        comments_text = request.form.get('comments_text', '').strip()
        
        if not inventory_id or not location_desc:
            flash('Please select inventory and provide location description.', 'danger')
            inventories = db.session.query(Inventory).join(Warehouse).filter(Warehouse.status_code == 'A').all()
            return render_template('locations/create.html', inventories=inventories)
        
        new_location = Location(
            inventory_id=inventory_id,
            location_desc=location_desc.upper(),
            comments_text=comments_text,
            status_code='A'
        )
        
        add_audit_fields(new_location, current_user)
        
        db.session.add(new_location)
        db.session.commit()
        
        flash('Location created successfully.', 'success')
        return redirect(url_for('locations.list_locations'))
    
    inventories = db.session.query(Inventory).join(Warehouse).filter(Warehouse.status_code == 'A').all()
    return render_template('locations/create.html', inventories=inventories)
