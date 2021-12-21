json.bills @bills do |bill|
    json.partial "bill", obj: bill
end