class Contact
  
  @@contacts=[]
  
  attr_reader :full_name,:email,:address,:phone

  def initialize(full_name="",email="",address="",phone="")
    if(is_valid?(full_name,"full_name") && is_valid?(email,"email") && is_valid?(address,"address") && is_valid?(phone))
      @full_name=full_name 
      @email=email 
      @address=address 
      @phone=phone
    end
    @@contacts << self
  end

   def is_valid?(value,variable_type)
    case variable_type
      when "email"
        value == "" || value.scan(/\w+@\w+.\w{3,}/)!=[]
      when "full_name"
        value !=""? true : false
      when "address"
        true
      when "phone"
        value.scan(/\(\d{3}\)\d{3}-\d{4}|\d{10}|\d{3}\s\d{3}\s\d{3}|\(\d{3}\)\d{7}|(509)?\s?\d{8}/)!=[]
      else
        raise "You did not pass a good variable type in the is_valid? function" 
    end
  end

  
  def email=(passed_email)
    if(is_valid?(passed_email,"email"))
      @email=passed_email
    else 
       @email = false 
    end
  end

  def address=(passed_address)
    if(is_valid?(passed_address))
      @address=passed_address
    else 
      @address=false
    end
  end

  def full_name=(passed_full_name="")
    if(is_valid?(passed_full_name))
      @full_name=passed_full_name
    else 
      @full_name=false 
    end
  end
  
  def phone=(passed_phone)
    if is_valid?(passed_phone)
      @phone=passed_phone
    else 
      @full_name=false
    end
  end

 
  def self.contacts
    @@contacts
  end
 
end

