require 'json'
require 'terminal-table'
require_relative 'contact'
class ContactApp

    @contacts=[]

    def initialize
      file_exist=File.exist?("contacts.json")
      if (!file_exist)
        contacts_json=File.open("contacts.json","w")
        contacts_json.puts(@contacts.to_json)
        contacts_json.close
      else 
        file=File.read("contacts.json")
        @contacts=JSON.parse(file)
      end
      launch_app
    end
  
    def display_menu
      loop do
        puts "1.- Add contact"
        puts "2.- Display all contacts"
        puts "3.- Modify a contact"
        puts "4.- Delete a contact"
        puts "5.- Save & exit the program"
        puts "Select an action from the menu. HINT: You should create a contact first."
        @choice=gets.strip.to_i
        break if (1..5).include?(@choice)
      end
      manage_choice
    end
  
    def manage_choice
        case @choice
            when 1
                puts "Adding a contact..."
                add_a_contact
            when 2
                puts "Displaying all contacts.."
                display_contacts
            when 3
                puts "Modifying a contact..."
                modify_contact
            when 4
                puts "Deleting a contact..."
                delete_contact
            when 5
                puts "Saving contacts and exiting the program"
                saving_and_exiting
        end
        display_menu
    end

    def contact_rows
      index = 0
      rows=[]
        contactIndex=0
        @contacts.each do |contact|
            rowContact=contact.values.flatten
            rowContact.unshift(contactIndex+1)
            rows.push(rowContact)
            contactIndex+=1
        end
        @rows=rows
    end
  
    def launch_app
      puts "Welcome to my Ruby CLI Contact List"
      display_menu
    end
  
    def display_contacts
     if @contacts.empty?
      puts "The list is empty..."
     else 
      
     contact_rows
     format_table
     end
    end

    def format_table
      table = Terminal::Table.new :title => "Ruby CLI Contact App", :headings => ['ID', 'Full Name','Email','Address','Phone Number'], :rows => @rows
      puts table
    end
  
    def add_a_contact
      contact=Contact.new()
      loop do 
        puts "Enter Contact full name: "
        contact.full_name=gets.strip
        break if contact.full_name != false
      end
      loop do
        puts "Enter Contact Email:"
        contact.email=gets.strip 
        break if contact.email != false
      end
        puts "Enter Contact Address:"
        contact.address=gets.strip 
      loop do 
        puts "Enter Contact phone number"
        contact.phone=gets.strip
        break if contact.phone !=false
      end
      
      @contacts << contact.contact_hash
      puts "contact created successfuly"
    end
  
    def modify_contact
        if @contacts.length!=0
            loop do 
                puts "Which contact you want to modify?"
                choice=gets.strip.to_i
                choice-=1
        
                if choice>=0 && @contacts[choice]!=nil
                    break 
                else
                    puts "Invalid ID" 
                end
             end
                
              contact=Contact.new()
              puts "Enter Contact full name: "
              contact.full_name=gets.strip
              puts "Enter Contact email:"
              contact.email=gets.strip
              puts "Enter Contact Address"
              contact.address=gets.strip
              puts "Enter Contact phone number"
              contact.phone=gets.strip
      
              @contacts[choice]=contact.contact_hash
              puts "contact modified successfuly"
        else 
            puts "The list is empty!"
        end
    end
  
    def delete_contact
      puts "Which contact you want to delete?"
      choice=gets.strip.to_i 
      choice-=1
      p choice
      puts "Deleting contact..."
      if choice >= 0 && @contacts[choice]!=nil
        @contacts.delete_at(choice)
        puts "Contact deleted."
      else
        puts "Invalid ID"
      end 
  
    end

    def saving_and_exiting
      contacts_json=File.open("contacts.json","w")
      contacts_json.puts(@contacts.to_json)
      contacts_json.close
      abort("Thank You for using this app!")
    end
  
  end
  
  
