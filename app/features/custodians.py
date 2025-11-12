from flask import Blueprint, render_template, request, redirect, url_for, flash
from flask_login import login_required, current_user
from datetime import datetime
from app.db.models import db, Custodian
from app.core.audit import add_audit_fields

custodians_bp = Blueprint('custodians', __name__)

@custodians_bp.route('/')
@login_required
def list_custodians():
    custodians = Custodian.query.order_by(Custodian.custodian_name).all()
    return render_template('custodians/index.html', custodians=custodians)

@custodians_bp.route('/create', methods=['GET', 'POST'])
@login_required
def create():
    if request.method == 'POST':
        custodian_name = request.form.get('custodian_name', '').strip().upper()
        
        if not custodian_name:
            flash('Custodian name is required.', 'danger')
            return render_template('custodians/create.html')
        
        if Custodian.query.filter_by(custodian_name=custodian_name).first():
            flash(f'A custodian with the name {custodian_name} already exists.', 'danger')
            return render_template('custodians/create.html')
        
        new_custodian = Custodian(custodian_name=custodian_name)
        add_audit_fields(new_custodian, current_user.email)
        
        db.session.add(new_custodian)
        db.session.commit()
        
        flash(f'Custodian {custodian_name} created successfully.', 'success')
        return redirect(url_for('custodians.list_custodians'))
    
    return render_template('custodians/create.html')

@custodians_bp.route('/<int:custodian_id>/edit', methods=['GET', 'POST'])
@login_required
def edit(custodian_id):
    custodian = Custodian.query.get_or_404(custodian_id)
    
    if request.method == 'POST':
        new_name = request.form.get('custodian_name', '').strip().upper()
        
        if not new_name:
            flash('Custodian name is required.', 'danger')
            return render_template('custodians/edit.html', custodian=custodian)
        
        existing = Custodian.query.filter(
            Custodian.custodian_name == new_name,
            Custodian.custodian_id != custodian_id
        ).first()
        
        if existing:
            flash(f'A custodian with the name {new_name} already exists.', 'danger')
            return render_template('custodians/edit.html', custodian=custodian)
        
        custodian.custodian_name = new_name
        custodian.update_by_id = current_user.email.upper()
        custodian.update_dtime = datetime.utcnow()
        custodian.version_nbr += 1
        
        db.session.commit()
        
        flash(f'Custodian updated successfully.', 'success')
        return redirect(url_for('custodians.list_custodians'))
    
    return render_template('custodians/edit.html', custodian=custodian)
