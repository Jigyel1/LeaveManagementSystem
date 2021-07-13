json.array! @notifications do |notification|
    json.id notification.id
    json.actor notification.actor_id
    json.recipient notification.recipient_id
    json.action notification.action
    json.url profile_index_path
end