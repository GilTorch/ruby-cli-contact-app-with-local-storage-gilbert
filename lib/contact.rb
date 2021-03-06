class Contact
  
    @@contacts=[]
    
    def initialize(full_name="",email="",address="",phone="")
     if (full_name!="")
      @contact_object={
        full_name: full_name,
        email: email,
        address: address,
        phone: phone
        }
     else
        @contact_object={full_name:"",email:"",address:"",phone:""}
     end
    end
  
    def full_name=(passed_full_name="")
      if(passed_full_name!="")
         @contact_object[:full_name]=passed_full_name
      else
        raise "Full Name is required for the contact"
      end
      # contact_hash
    end
  
    def phone=(passed_phone)
      if(passed_phone.scan(/\(\d{3}\)\d{3}-\d{4}|\d{10}|\d{3}\s\d{3}\s\d{3}|\(\d{3}\)\d{7}|(509)?\s?\d{8}/)!=[])
        @contact_object[:phone]=passed_phone
      else
        if(passed_phone!="")
          raise "Your phone number doesn't match a US or Haitian phone pattern"
        end
      end 
    end
  
    def email=(passed_email)
      if(passed_email.scan(/\w+@\w+.\w{3,}/)!=[])
        @contact_object[:email]=passed_email
      else
        if(passed_email!="")
          raise "You didn't pass a valid email"
        end
      end
    end
  
    def address=(passed_address)
      @contact_object[:address]=passed_address
    end
  
    def contact_hash
      @contact_object
    end
  
    def self.contacts
      @@contacts
    end
  
   
  end