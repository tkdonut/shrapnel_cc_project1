class Transaction
  def initialize(options)
    @id = options['id'] if options['id']
    @amount = options['amount']
    #TODO: Probably want to change this to a ruby money object at some point. String until MVP
    @tag_id = options['tag_id']
    @vendor_id = options['vendor_id']
  end
end
