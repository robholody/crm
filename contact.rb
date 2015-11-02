class Contact
	attr_reader :id
	attr_accessor :first_name, :last_name, :email, :notes


	#CLASS VARIABLE = DEFINE IN THE WHOLE CONTACTS


	@@contacts = []
	@@id = 1
	

	# attr_accessor creates these getter and setter

	# GETTER
	# def first_name
	# 	@first_name
	# end

	# SETTER
	# def first_name=(new_first_name)
	# 	@first_name = new_first_name
	# end


	def initialize(first_name, last_name, options = {}) # {} hash allows to extend further variables, or return nil if variables lacking
		@first_name = first_name
		@last_name = last_name
		@email = options[:email]
		@notes = options[:notes]

		@id = @@id
		@@id += 1
	end


	def self.create(first_name, last_name, options = {})
		new_contact = Contact.new(first_name, last_name, options) 
		@@contacts << new_contact
	end


	def self.all #class method
		@@contacts
	end


	def self.find(id)
		contacts = @@contacts.select do |contact|
			contact.id == id
	end

		contacts.first
	end


	def display_first_name(first_name)
		@@contacts.each do |first_name|
			if contact.first_name = first_name
				return contact
			end
		end
	end


	def self.display_attribute(attribute)
		list = []
		@@contacts.each do |contact|
			list << contact.send(attribute)
		end
		return list
	end


	def self.delete_contact(user_specified_id)
		@@contacts.delete_if { |contact| contact.id == user_specified_id }
	end


	def update(field, new_value)
		self.send("#{field}=", new_value)
	end


	def full_name
		"#{first_name} #{last_name}"
	end

end

#remember internet was down to commit. push
