from flask import Blueprint, render_template
from flask_login import login_required
from sqlalchemy import func
from app.db.models import db, Inventory, Item, NeedsList, Fulfilment

notifications_bp = Blueprint('notifications', __name__)

@notifications_bp.route('/')
@login_required
def index():
    low_stock_items = db.session.query(
        Item.item_id, 
        Item.item_name,
        func.sum(Inventory.usable_qty).label('total_qty'),
        Item.reorder_level
    ).join(Inventory).filter(
        Item.status_code == 'A'
    ).group_by(
        Item.item_id, Item.item_name, Item.reorder_level
    ).having(
        func.sum(Inventory.usable_qty) <= Item.reorder_level
    ).all()
    
    pending_needs = NeedsList.query.filter_by(status='Submitted').count()
    pending_fulfilments = Fulfilment.query.filter_by(status='In Preparation').count()
    
    notifications = []
    
    if low_stock_items:
        for item in low_stock_items:
            notifications.append({
                'type': 'warning',
                'icon': 'exclamation-triangle-fill',
                'title': 'Low Stock Alert',
                'message': f'{item.item_name} is below reorder level ({item.total_qty:.2f} / {item.reorder_level:.2f})',
                'link': f'/items/{item.item_id}',
                'timestamp': 'Just now'
            })
    
    if pending_needs > 0:
        notifications.append({
            'type': 'info',
            'icon': 'clipboard-check',
            'title': 'Pending Needs Lists',
            'message': f'{pending_needs} needs list(s) awaiting approval',
            'link': '/needs_list/',
            'timestamp': 'Today'
        })
    
    if pending_fulfilments > 0:
        notifications.append({
            'type': 'info',
            'icon': 'truck',
            'title': 'Pending Fulfilments',
            'message': f'{pending_fulfilments} fulfilment(s) in preparation',
            'link': '/fulfilment/',
            'timestamp': 'Today'
        })
    
    return render_template('notifications/index.html', notifications=notifications)
