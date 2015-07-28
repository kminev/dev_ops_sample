trigger onUpdateChangeOwner on Case (before update) {
    
    CaseOwnerChange.checkQueue(Trigger.new, Trigger.old);
}