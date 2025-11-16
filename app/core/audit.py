"""
Audit field helpers for DRIMS
All aidmgmt-3.sql tables require audit fields on insert/update
"""
from datetime import datetime

def add_audit_fields(obj, user, is_new=True):
    """
    Add or update audit fields on a model object
    
    Args:
        obj: SQLAlchemy model instance
        user: User object (will use user.user_name for audit fields)
        is_new: True if creating new record, False if updating
    """
    now = datetime.now()
    
    # Get user_name from User object, fallback to email if user_name not set
    if hasattr(user, 'user_name') and user.user_name:
        audit_id = user.user_name.upper()
    elif hasattr(user, 'email'):
        # Fallback to email (truncated) for backward compatibility
        audit_id = user.email.upper()[:20]
    else:
        # If user is a string (for backward compatibility), use it directly
        audit_id = str(user).upper()[:20]
    
    if is_new:
        if hasattr(obj, 'create_by_id'):
            obj.create_by_id = audit_id
        if hasattr(obj, 'create_dtime'):
            obj.create_dtime = now
        if hasattr(obj, 'version_nbr'):
            obj.version_nbr = 1
    
    if hasattr(obj, 'update_by_id'):
        obj.update_by_id = audit_id
    if hasattr(obj, 'update_dtime'):
        obj.update_dtime = now
    if hasattr(obj, 'version_nbr') and not is_new:
        obj.version_nbr += 1
    
    return obj

def add_verify_fields(obj, user):
    """
    Add verification audit fields
    
    Args:
        obj: SQLAlchemy model instance
        user: User object (will use user.user_name for audit fields)
    """
    now = datetime.now()
    
    # Get user_name from User object, fallback to email if user_name not set
    if hasattr(user, 'user_name') and user.user_name:
        audit_id = user.user_name.upper()
    elif hasattr(user, 'email'):
        # Fallback to email (truncated) for backward compatibility
        audit_id = user.email.upper()[:20]
    else:
        # If user is a string (for backward compatibility), use it directly
        audit_id = str(user).upper()[:20]
    
    if hasattr(obj, 'verify_by_id'):
        obj.verify_by_id = audit_id
    if hasattr(obj, 'verify_dtime'):
        obj.verify_dtime = now
    
    return obj
