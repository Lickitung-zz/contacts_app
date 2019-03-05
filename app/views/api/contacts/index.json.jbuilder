json.array! @contacts.each do |contact|
    json.name contact.name
    json.phone_number contact.phone_number
    json.email contact.email
end