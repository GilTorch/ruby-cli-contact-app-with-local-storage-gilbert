require 'terminal-table'
require_relative 'contact'
class ContactApp
    @contact=[]
  
    def initialize
      launch_app
    end
  
    def display_menu
      loop do
        puts "1.- Add contact"
        puts "2.- Display all contacts"
        puts "3.- Modify a contact"
        puts "4.- Delete a contact"
        puts "5.- Exit the program"
        puts "Select an action from the menu. HINT: You should create a contact first."
        @choice=gets.strip.to_i
        break if (1..5).include?(@choice)
      end
      manage_choice
    end
  
    def manage_choice
       case @choice
      when 1
        "You will add a contact"
         add_a_contact
         display_menu
      when 2
        " display all contacts"
         display_contacts
         display_menu
      when 3
      "You will modify a contact"
        modify_contact
        display_menu
      when 4
        "You will delete a contact"
         delete_contact
         display_menu
      when 5
        "Saving contacts and exiting the program"
      end
    end
  
    def launch_app
      puts "Welcome to my Ruby CLI Contact List"
      display_menu
    end
  
    def display_contacts
     if Contact::contacts.empty?
      puts "The list is empty..."
     else 
      index = 0
      rows=[]
        contactIndex=0
        Contact::contacts.each do |contact|
            rowContact=contact.values.flatten
            rowContact.unshift(contactIndex+1)
            rows.push(rowContact)
            contactIndex+=1
        end

        table = Terminal::Table.new :title => "Ruby CLI Contact App", :headings => ['ID', 'Full Name','Email','Address','Phone Number'], :rows => rows

        puts table
     end
    end
  
    def add_a_contact
      contact=Contact.new()
      puts "Enter Contact full name: "
      contact.full_name=gets.strip
      puts "Enter Contact email:"
      contact.email=gets.strip
      puts "Enter Contact Address"
      contact.address=gets.strip
      puts "Enter Contact phone number"
      contact.phone=gets.strip
      Contact::contacts << contact.contact_hash
      puts "contact created successfuly"
    end
  
    def modify_contact
      puts "Which contact you want to modify?"
      choice=gets.strip.to_i
      choice-=1
      if choice>=0 || Contact::contacts[choice]!=nil
        contact=Contact.new()
        puts "Enter Contact full name: "
        contact.full_name=gets.strip
        puts "Enter Contact email:"
        contact.email=gets.strip
        puts "Enter Contact Address"
        contact.address=gets.strip
        puts "Enter Contact phone number"
        contact.phone=gets.strip
        Contact::contacts[choice]=contact.contact_hash
        puts "contact modified successfuly"
      end
  
    end
  
    def delete_contact
      puts "Which contact you want to delete?"
      choice=gets.strip.to_i 
      choice-=1
      p choice
      puts "Deleting contact..."
      if choice >= 0 || Contact::contacts[choice]!=nil
        Contact::contacts.delete_at(choice)
        puts "Contact deleted."
      else
        puts "invalid index"
      end 
  
    end
  
  end
  
  
