from flask import Blueprint, render_template, request, redirect, url_for, flash
from flask_login import login_required, current_user
from datetime import datetime
from app.db.models import db, Agency, Parish
from app.core.audit import add_audit_fields

agencies_bp = Blueprint('agencies', __name__)

@agencies_bp.route('/')
@login_required
def list_agencies():
    agencies = Agency.query.order_by(Agency.agency_name).all()
    return render_template('agencies/index.html', agencies=agencies)

@agencies_bp.route('/create', methods=['GET', 'POST'])
@login_required
def create():
    if request.method == 'POST':
        agency_name = request.form.get('agency_name', '').strip().upper()
        address1_text = request.form.get('address1_text', '').strip()
        address2_text = request.form.get('address2_text', '').strip() or None
        parish_code = request.form.get('parish_code')
        contact_name = request.form.get('contact_name', '').strip().upper()
        phone_no = request.form.get('phone_no', '').strip()
        email_text = request.form.get('email_text', '').strip().lower() or None
        
        if not agency_name or not address1_text or not parish_code or not contact_name or not phone_no:
            flash('Please fill in all required fields.', 'danger')
            return render_template('agencies/create.html', parishes=Parish.query.all())
        
        if Agency.query.filter_by(agency_name=agency_name).first():
            flash(f'An agency with the name {agency_name} already exists.', 'danger')
            return render_template('agencies/create.html', parishes=Parish.query.all())
        
        new_agency = Agency(
            agency_name=agency_name,
            address1_text=address1_text,
            address2_text=address2_text,
            parish_code=parish_code,
            contact_name=contact_name,
            phone_no=phone_no,
            email_text=email_text
        )
        
        add_audit_fields(new_agency, current_user.email)
        
        db.session.add(new_agency)
        db.session.commit()
        
        flash(f'Agency {agency_name} created successfully.', 'success')
        return redirect(url_for('agencies.view', agency_id=new_agency.agency_id))
    
    parishes = Parish.query.all()
    return render_template('agencies/create.html', parishes=parishes)

@agencies_bp.route('/<int:agency_id>')
@login_required
def view(agency_id):
    agency = Agency.query.get_or_404(agency_id)
    return render_template('agencies/view.html', agency=agency)

@agencies_bp.route('/<int:agency_id>/edit', methods=['GET', 'POST'])
@login_required
def edit(agency_id):
    agency = Agency.query.get_or_404(agency_id)
    
    if request.method == 'POST':
        agency.address1_text = request.form.get('address1_text', '').strip()
        agency.address2_text = request.form.get('address2_text', '').strip() or None
        agency.parish_code = request.form.get('parish_code')
        agency.contact_name = request.form.get('contact_name', '').strip().upper()
        agency.phone_no = request.form.get('phone_no', '').strip()
        agency.email_text = request.form.get('email_text', '').strip().lower() or None
        
        agency.update_by_id = current_user.email.upper()
        agency.update_dtime = datetime.utcnow()
        agency.version_nbr += 1
        
        db.session.commit()
        
        flash(f'Agency {agency.agency_name} updated successfully.', 'success')
        return redirect(url_for('agencies.view', agency_id=agency.agency_id))
    
    parishes = Parish.query.all()
    return render_template('agencies/edit.html', agency=agency, parishes=parishes)
