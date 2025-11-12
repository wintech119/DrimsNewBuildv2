from flask import Blueprint, render_template, request, redirect, url_for, flash
from flask_login import login_required, current_user
from datetime import datetime, date
from app.db.models import db, Transfer, TransferItem, Warehouse, Inventory, Item
from app.core.audit import add_audit_fields

transfers_bp = Blueprint('transfers', __name__)

@transfers_bp.route('/')
@login_required
def list_transfers():
    transfers = Transfer.query.order_by(Transfer.transfer_date.desc()).all()
    return render_template('transfers/index.html', transfers=transfers)

@transfers_bp.route('/<int:transfer_id>')
@login_required
def view(transfer_id):
    transfer = Transfer.query.get_or_404(transfer_id)
    return render_template('transfers/view.html', transfer=transfer)
