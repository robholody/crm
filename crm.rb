require_relative 'contact.rb'

class CRM
  def initialize(name)
    @name = name
  end

  def print_main_menu
    puts "1. Add a contact"
    puts "2. Modify a contact"
    puts "3. Display all contacts"
    puts "4. Display contact"
    puts "5. Display contact attribute"
    puts "6. Delete a contact"
    puts "7. Exit"
  end

  def main_menu
    while true
      print_main_menu
      print "Choose an option: "
      user_input = gets.chomp.to_i
      break if user_input == 7
      choose_option(user_input)
    end
  end

  def choose_option(input)
    # input = user_input into program
    case input
    when 1 then add_contact
    when 2 then modify_contact
    when 3 then display_all_contacts
    when 4 then display_contact
    when 5 then display_contact_attribute
    when 6 then delete_contact
    when 7 then exit
    else
      puts "I'm sorry, that is an unknown option, please select again"
    end
  end

#add a contact
  def add_contact
    print "First name: "
    first_name = gets.chomp
    print "Last name: "
    last_name = gets.chomp
    print "Email: "
    email = gets.chomp
    print "Notes: "
    notes = gets.chomp
    Contact.create(first_name, last_name, email: email, notes: notes)
  end

#modify a contact
  def modify_contact
    puts "Enter the name of the contact that you would like to modify"
    id_to_modify = gets.chomp
    contact = Contact.find(id_to_modify)
    puts "Are you sure? (y/n)"
    answer = gets.chomp
    if answer == "y"
      puts "What would you like to change? 1. First name 2. Last name 3. Email 4. Notes "
      field = gets.chomp
      puts "Enter changes"
      new_value = gets.chomp
      case field
      when 1
        contact.first_name = new_value
      when 2
        contact.last_name = new_value
      when 3
        contact.email = new_value
      when 4
        contact.notes = new_value
      end
      puts "Your contacts info was changed to #{new_value}"

    else
      main_menu
    end

  end

#display all contacts
  def display_all_contacts
    Contact.all.each do |contact|
      puts "#{contact.full_name}, #{contact.email} #{contact.notes} #{contact.id}"
    end
    puts "Press enter to continue"
    continue = gets.chomp
  end

#display a* contact
  def display_contact
    puts "Which contact would you like to display"
    display = gets.chomp.to_i
    contact = Contact.find(display)
    puts "#{contact.full_name}, #{contact.email} #{contact.notes} #{contact.id}"
    # contact.first_name ??
  end

#display contacts information fy attribute
  def display_contact_attribute
    puts "Choose a contact attribute. 1. First name 2. Last name 3. email 4. notes"
    attribute_number = gets.chomp.to_i
    case attribute_number
      when 1
        puts Contact.display_attribute("first_name")
      when 2
        puts Contact.display_attribute("last_name")
      when 3
        puts Contact.display_attribute("email")
      when 4
        puts Contact.display_attribute("notes")
    end
  end

#delete a contact
  def delete_contact
    puts "Please enter the contact to delete"
    user_specified_id = gets.chomp.to_i

    Contact.delete_contact(user_specified_id)
  end
end



my_awesome_crm = CRM.new('Bitmaker CRM')
my_awesome_crm.main_menu