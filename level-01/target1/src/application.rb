#Application Program

class Department #class Department
  attr_accessor :s_name,:section,:stu_name_a,:student_name,:stu_name_b,:stu_name_c,:a_roll_tot,:b_roll_tot,:c_roll_tot

  def initialize
    self.section = {"A"=>10,"B"=>10,"C"=>10}
    @@str_temperary = ""
    @@sec = 0
    @@ar_index = 0
    @@dept_students_count = 0
    @@roll_no = 0
    @@count_a = 0
    @@count_b = 0
    @@count_c = 0
    self.s_name = []
    self.a_roll_tot = []
    self.b_roll_tot = []
    self.c_roll_tot = []
    self.stu_name_a = []
    self.stu_name_b = []
    self.stu_name_c = [] 
  end

  def statements(dept,sec,roll) #enroll statements
  	return "You have been enrolled to #{dept}\nYou have been allotted section #{sec}\nYour roll number is #{roll}"
  end

  def statements1(sect,roll)#enroll statements
    return "You have been allotted section #{sect}\nYour roll number is #{roll}"
  end

  def stu_det(name,section,dept,roll) #get student details format
  	return name + " - " + dept + " - Section " + section + " - " + roll
  end


  def set_rollno(counter,sect,dept_name) #assign roll number
    if counter < 10
      return "#{dept_name}" + sect + "0" + counter.to_s
    else
      return "#{dept_name}" + sect + counter.to_s
    end
  end

  def tot_stu_nm #return the entire student list in a Department
    s_name = stu_name_a + stu_name_b + stu_name_c
    return s_name
  end
  
  def a_count 
    return @@count_a
  end

  def b_count
    return @@count_b
  end

  def c_count
    return @@count_c
  end

  def total_stu_count #return total number of students in a Department
    return @@dept_students_count
  end

  def s_name_detail(name_stu,dept) #get details of the student
    if stu_name_a.include?(name_stu)
      @@ar_index = stu_name_a.find_index(name_stu)
      stu_det(name_stu,"A",dept,a_roll_tot[@@ar_index])

    elsif stu_name_b.include?(name_stu)
      @@ar_index = stu_name_b.find_index(name_stu)
      stu_det(name_stu,"B",dept,b_roll_tot[@@ar_index])

    elsif stu_name_c.include?(name_stu)
      @@ar_index = stu_name_c.find_index(name_stu)
      stu_det(name_stu,"C",dept,c_roll_tot[@@ar_index])
    end
  end

  def stu_deduct(nm) #remove student from the previous section 
    if stu_name_a.include?(nm)
      @@ar_index = stu_name_a.find_index(nm)
      stu_name_a.delete_at(@@ar_index)
      a_roll_tot.delete_at(-1)
      @@dept_students_count -=1
      @@count_a -=1
      section["A"] -= 1

    elsif stu_name_b.include?(nm)
      @@ar_index = stu_name_b.find_index(nm)
      stu_name_b.delete_at(@@ar_index)
      b_roll_tot.delete_at(-1)
      @@dept_students_count -=1
      @@count_b -=1
      section["B"] -= 1

    elsif stu_name_c.include?(nm)
      @@ar_index = stu_name_c.find_index(nm)
      stu_name_c.delete_at(@@ar_index)
      c_roll_tot.delete_at(-1)
      @@dept_students_count -=1
      @@count_c -=1
      section["C"] -= 1
    end
  end

  #View section
  def sect_a_view 
    for i in (0..(@@count_a - 1))
      @@str_temperary += "\n" + stu_name_a[i] + " - " + a_roll_tot[i].to_s
    end
    return @@str_temperary
  end

  def sect_b_view
    for i in (0..(@@count_b - 1))
      @@str_temperary += "\n" + stu_name_b[i] + " - " + b_roll_tot[i].to_s
    end
    return @@str_temperary
  end

  def sect_c_view
    for i in (0..(@@count_c - 1))
      @@str_temperary += "\n" + stu_name_c[i] + " - " + c_roll_tot[i].to_s
    end
    return @@str_temperary
  end

  def dept_view
    sect_a_view
    sect_b_view
    sect_c_view
  end

  #add students to a particular section
  def add_to_a(sname,dept)
    @@sec = "A"
    section["A"] -= 1
    @@count_a += 1
    @@roll_no = set_rollno(@@count_a,@@sec,dept)
    a_roll_tot<<@@roll_no
    @stu_name_a<<sname
    @stu_name_a.sort!
    @@dept_students_count +=1
    return statements1(@@sec,@@roll_no) 
  end

  def add_to_b(sname,dept)
    @@sec = "B"
    section["B"] -= 1
    @@count_b += 1
    @@roll_no = set_rollno(@@count_b,@@sec,dept)
    b_roll_tot<<@@roll_no
    @stu_name_b<<sname
    @stu_name_b.sort!
    @@dept_students_count +=1
    return statements1(@@sec,@@roll_no) 
  end

  def add_to_c(sname,dept)
    @@sec = "C"
    section["C"] -= 1
    @@count_c += 1
    @@roll_no = set_rollno(@@count_c,@@sec,dept)
    c_roll_tot<<@@roll_no
    @stu_name_c<<sname
    @stu_name_c.sort!
    @@dept_students_count +=1
    return statements1(@@sec,@@roll_no) 
  end

  def add_s(sname,dept)
    if section["A"] >= 1
      @@sec = "A"
      section["A"] -= 1
      @@count_a += 1
      @@roll_no = set_rollno(@@count_a,@@sec,dept)
      a_roll_tot<<@@roll_no
      @stu_name_a<<sname
      @stu_name_a.sort!
      @@dept_students_count +=1
    
    elsif section["B"] >= 1
      @@sec = "B"
      section["B"] -= 1
      @@count_b += 1
      @@roll_no = set_rollno(@@count_b,@@sec,dept)
      b_roll_tot<<@@roll_no
      @stu_name_b<<sname
      @stu_name_b.sort!
      @@dept_students_count +=1
    
    elsif section["C"] >= 1
      @@sec = "C"
      section["C"] -= 1
      @@count_c += 1
      @@roll_no = set_rollno(@@count_c,@@sec,dept)
      c_roll_tot<<@@roll_no
      @stu_name_c<<sname
      @stu_name_c.sort!
      @@dept_students_count +=1

    else
      return "Seats are not available in #{dept}"
    end
    return statements(dept,@@sec,@@roll_no)
  end
end

# Your application
class Application
  attr_accessor :eee,:mech,:cse,:civil

  def initialize
    self.eee = Department.new
    self.mech = Department.new
    self.cse = Department.new
    self.civil = Department.new
  end

  def enroll(student_name, student_Department)
    
    case student_Department
    when "EEE"
      return eee.add_s(student_name,student_Department)
    when "MECH"
      return mech.add_s(student_name,student_Department)
    when "CSE"
      return cse.add_s(student_name,student_Department) 
    when "CIVIL"
      return civil.add_s(student_name,student_Department)
    end
  end

  def change_dept(student_name, student_Department)
    ## write some logic to frame the string below
    if !(mech.tot_stu_nm.include?(student_name) || civil.tot_stu_nm.include?(student_name) || cse.tot_stu_nm.include?(student_name) || eee.tot_stu_nm.include?(student_name))
      return "Error: Student name not available"
    end

    case student_Department
    when "EEE"
      if eee.total_stu_count < 30
        if (mech.tot_stu_nm.include?(student_name))
          mech.stu_deduct(student_name)
          return eee.add_s(student_name,student_Department)
        elsif (civil.tot_stu_nm.include?(student_name))
          civil.stu_deduct(student_name)
          return eee.add_s(student_name,student_Department)
        elsif (cse.tot_stu_nm.include?(student_name))
          cse.stu_deduct(student_name)
          return eee.add_s(student_name,student_Department)
        end
      else
        "Error: Seats are not available in EEE"
      end

    when "MECH"
      if mech.total_stu_count < 30
        if (eee.tot_stu_nm.include?(student_name))
          eee.stu_deduct(student_name)
          return mech.add_s(student_name,student_Department)
        elsif (civil.tot_stu_nm.include?(student_name))
          civil.stu_deduct(student_name)
          return mech.add_s(student_name,student_Department)
        elsif (cse.tot_stu_nm.include?(student_name))
          cse.stu_deduct(student_name)
          return mech.add_s(student_name,student_Department)
        end
      else
        "Error: Seats are not available in MECH"
      end

    when "CSE"
      if cse.total_stu_count < 30
        if (mech.tot_stu_nm.include?(student_name))
          mech.stu_deduct(student_name)
          return cse.add_s(student_name,student_Department)
        elsif (civil.tot_stu_nm.include?(student_name))
          civil.stu_deduct(student_name)
          return cse.add_s(student_name,student_Department)
        elsif (eee.tot_stu_nm.include?(student_name))
          eee.stu_deduct(student_name)
          return cse.add_s(student_name,student_Department)
        end
      else
        "Error: Seats are not available in CSE"
      end

    when "CIVIL"
      if civil.total_stu_count < 30
        if (mech.tot_stu_nm.include?(student_name))
          mech.stu_deduct(student_name)
          return civil.add_s(student_name,student_Department)
        elsif (eee.tot_stu_nm.include?(student_name))
          eee.stu_deduct(student_name)
          return civil.add_s(student_name,student_Department)
        elsif (cse.tot_stu_nm.include?(student_name))
          cse.stu_deduct(student_name)
          return civil.add_s(student_name,student_Department)
        end
      else
        "Error: Seats are not available in CIVIL"
      end
    else
      "Error: Seats are not available in #{student_Department}"
    end
  end
  
  def change_section(student_name, section)
    ## write some logic to frame the string below
    if eee.tot_stu_nm.include?(student_name)
      case section
      when "A"
        if eee.a_count < 10
          eee.stu_deduct(student_name)
          eee.add_to_a(student_name,"EEE")
        else
          "Error: Seats are not available in A section"
        end
      when "B"
        if eee.b_count < 10
          eee.stu_deduct(student_name)
          eee.add_to_b(student_name,"EEE")
        else
          "Error: Seats are not available in B section"
        end
      when "C"
        if eee.c_count < 10
          eee.stu_deduct(student_name)
          eee.add_to_c(student_name,"EEE")
        else
          "Error: Seats are not available in C section"
        end
      end

    elsif mech.tot_stu_nm.include?(student_name)
      case section
      when "A"
        if mech.a_count < 10
          mech.stu_deduct(student_name)
          mech.add_to_a(student_name,"MECH")
        else
          "Error: Seats are not available in A section"
        end
      when "B"
        if mech.b_count < 10
          mech.stu_deduct(student_name)
          mech.add_to_b(student_name,"MECH")
        else
          "Error: Seats are not available in B section"
        end
      when "C"
        if mech.c_count < 10
          mech.stu_deduct(student_name)
          mech.add_to_c(student_name,"MECH")
        else
          "Error: Seats are not available in C section"
        end
      end

    elsif cse.tot_stu_nm.include?(student_name)
      case section
      when "A"
        if cse.a_count < 10
          cse.stu_deduct(student_name)
          cse.add_to_a(student_name,"CSE")
        else
          "Error: Seats are not available in A section"
        end
      when "B"
        if cse.b_count < 10
          cse.stu_deduct(student_name)
          cse.add_to_b(student_name,"CSE")
        else
          "Error: Seats are not available in B section"
        end
      when "C"
        if cse.c_count < 10
          cse.stu_deduct(student_name)
          cse.add_to_c(student_name,"CSE")
        else
          "Error: Seats are not available in C section"
        end
      end

    elsif civil.tot_stu_nm.include?(student_name)
      case section
      when "A"
        if civil.a_count < 10
          civil.stu_deduct(student_name)
          civil.add_to_a(student_name,"CIVIL")
        else
          "Error: Seats are not available in A section"
        end
      when "B"
        if civil.b_count < 10
          civil.stu_deduct(student_name)
          civil.add_to_b(student_name,"CIVIL")
        else
          "Error: Seats are not available in B section"
        end
      when "C"
        if civil.c_count < 10
          civil.stu_deduct(student_name)
          civil.add_to_c(student_name,"CIVIL")
        else
          "Error: Seats are not available in C section"
        end
      end
    else
      "Error: Seats are not available"
    end
  end

  def Department_view(student_dept)
    ## write some logic to frame the string below
    @@temp_str = "List of students:"
    case student_dept
    when "EEE"
      @@temp_str + eee.dept_view
    when "CSE"
      @@temp_str + cse.dept_view
    when "CIVIL"
      @@temp_str + civil.dept_view
    when "MECH"
      @@temp_str + mech.dept_view
    end
  end

  def section_view(student_dept, section)
    ## write some logic to frame the string below
    @@temp_str = "List of students:"
    case student_dept
    when "EEE"
      case section
      when "A"
        @@temp_str + eee.sect_a_view
      when "B"
        @@temp_str + eee.sect_b_view
      when "C"
        @@temp_str + eee.sect_c_view
      end
    when "CSE"
      case section
      when "A"
        @@temp_str + cse.sect_a_view
      when "B"
        @@temp_str + cse.sect_b_view
      when "C"
        @@temp_str + cse.sect_c_view
      end
    when "CIVIL"
      case section
      when "A"
        @@temp_str + civil.sect_a_view
      when "B"
        @@temp_str + civil.sect_b_view
      when "C"
        @@temp_str + civil.sect_c_view
      end
    when "MECH"
      case section
      when "A"
        @@temp_str + mech.sect_a_view
      when "B"
        @@temp_str + mech.sect_b_view
      when "C"
        @@temp_str + mech.sect_c_view
      end
    end
  end

  def student_details(student_name)
    ## write some logic to frame the string below
    if (eee.tot_stu_nm.include?(student_name))
      return eee.s_name_detail(student_name,"EEE")

    elsif (mech.tot_stu_nm.include?(student_name))
      return mech.s_name_detail(student_name,"MECH")

    elsif (cse.tot_stu_nm.include?(student_name))
      return cse.s_name_detail(student_name,"CSE")

    elsif (civil.tot_stu_nm.include?(student_name))
      return civil.s_name_detail(student_name,"CIVIL")

    else
      return "Error: Student details not found"
    end
  end
end
