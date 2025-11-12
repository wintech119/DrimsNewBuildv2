from flask import Blueprint, render_template, request, redirect, url_for, flash
from flask_login import login_required, current_user
from app.db.models import db, ReceiptRecord, Fulfilment
from datetime import datetime

receipt_bp = Blueprint('receipt', __name__)

@receipt_bp.route('/')
@login_required
def index():
    receipts = ReceiptRecord.query.order_by(ReceiptRecord.received_at.desc()).all()
    return render_template('receipt/index.html', receipts=receipts)

@receipt_bp.route('/create_from_fulfilment/<int:fulfilment_id>', methods=['GET', 'POST'])
@login_required
def create_from_fulfilment(fulfilment_id):
    fulfilment = Fulfilment.query.get_or_404(fulfilment_id)
    
    if fulfilment.status != 'Dispatched':
        flash('Only dispatched fulfilments can have receipt records created', 'warning')
        return redirect(url_for('fulfilment.view', fulfilment_id=fulfilment_id))
    
    if request.method == 'POST':
        try:
            latest_receipt = ReceiptRecord.query.order_by(ReceiptRecord.id.desc()).first()
            next_id = (latest_receipt.id + 1) if latest_receipt else 1
            receipt_number = f"RR{next_id:06d}"
            
            receipt = ReceiptRecord(
                fulfilment_id=fulfilment.id,
                receipt_number=receipt_number,
                received_by=request.form.get('received_by', current_user.email),
                received_at=datetime.now(),
                condition_notes=request.form.get('condition_notes'),
                discrepancy_notes=request.form.get('discrepancy_notes')
            )
            
            db.session.add(receipt)
            db.session.commit()
            
            flash(f'Receipt record {receipt_number} created successfully', 'success')
            return redirect(url_for('receipt.view', receipt_id=receipt.id))
            
        except Exception as e:
            db.session.rollback()
            flash(f'Error creating receipt record: {str(e)}', 'danger')
    
    return render_template('receipt/create_from_fulfilment.html', fulfilment=fulfilment)

@receipt_bp.route('/<int:receipt_id>')
@login_required
def view(receipt_id):
    receipt = ReceiptRecord.query.get_or_404(receipt_id)
    return render_template('receipt/view.html', receipt=receipt)
