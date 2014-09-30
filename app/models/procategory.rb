class Procategory < ActiveRecord::Base
  has_many :projects

	def level
	  ddc = self.ddc
	  ddc_length = ddc.length - 1
	  level = 0
	  (1..ddc_length).each do |flag|
		  level = (flag) if (ddc[flag] != '0') && (ddc[flag] != '.')
	  end

		return level
  end

  def prefix_ddc
	  return ddc[0..(level)]
  end

	def children
    case self.level
    when 0
      return Procategory.where(["SUBSTR(ddc,1,?) = ? AND ddc != ? AND (( SUBSTR(ddc,2,1) = '0' AND SUBSTR(ddc,3,1) != '0' AND SUBSTR(ddc,4,1) = '' ) OR ( SUBSTR(ddc,2,1) != '0' AND SUBSTR(ddc,3,1)  = '0' ))", self.prefix_ddc.length, self.prefix_ddc, self.ddc]).order(ddc: :asc)
    when 1
      return Procategory.where(["SUBSTR(ddc,1,2) = ? AND SUBSTR(ddc,3,1) != '0' AND SUBSTR(ddc,4,1) = ''", self.prefix_ddc]).order(ddc: :asc)
    when 2
      return Procategory.where(["SUBSTR(ddc,1,3) = ? AND SUBSTR(ddc,4,1) = '.' AND SUBSTR(ddc,5,1) != '0' AND SUBSTR(ddc,6,1) = ''", self.prefix_ddc])
    else
      return Procategory.where(["SUBSTR(ddc,1,?) = ? AND ddc != ? AND SUBSTR(ddc,?,1)=''", self.prefix_ddc.length, self.prefix_ddc, self.ddc, self.prefix_ddc.length + 2])
    #   return Procategory.first
    end
	end

	def father
    prefix_ddc = self.prefix_ddc

    if self.level == 4
      father_prefix_ddc = prefix_ddc[0..(prefix_ddc.length-3)]
    else
      father_prefix_ddc = prefix_ddc[0..(prefix_ddc.length-2)]
    end

		if prefix_ddc.length == 1
			return nil
		else
			procateogry = Procategory.where(["SUBSTR(ddc,1,?) = ?", father_prefix_ddc.length,father_prefix_ddc]).order(ddc: :asc).first
			if procateogry
				return procateogry
			else
				return nil
			end
		end
	end

	def cousin
		level = self.level
    if level == 0
      return Procategory.where(["SUBSTR(ddc,2,1) = '0' AND SUBSTR(DDC,3,1) = '0'"]).order(ddc: :asc)
    else
      father = self.father
      # return Procategory.where(["SUBSTR(ddc,?,1) = ? AND SUBSTR(ddc,1,?) = ? AND SUBSTR(ddc,?,1) != ?", level + 2, '0', level, self.ddc[0..(level - 1)], level + 1, father.ddc[level]]).order(ddc: :asc)
			return father.children
    end
	end

	def children_ddcs
		ddc = self.prefix_ddc
		level = self.level
		array = Array.new
		if level < 2
			if level == 0
				(1..9).each do |item|
					array << (ddc + '0' + item.to_s)
				end
			end
			(1..9).each do |item|
				array << (ddc + item.to_s + '0')
			end
		else
			if level == 2
				(1..9).each do |item|
					array << (ddc + '.' + item.to_s)
				end
			else
				(1..9).each do |item|
					array << (ddc + item.to_s)
				end
			end
		end
		return array
	end

	def variable_ddcs
		children_ddcs = self.children_ddcs
		array = Array.new
		children_ddcs.each do |ddc|
			procategory = Procategory.find_by_ddc(ddc)
			array << ddc if procategory.nil?
		end
		return array
  end

  def family_tree
    father = self.father
    father_array = Array.new
    while father
      father_array << father
      father = father.father
    end
    return father_array
  end

  def full_name
    name = self.ddc + ' - ' + self.name
    return name
  end

	def projects_user(user)
		return self.projects.where(["user_id = ?", user.id])
	end

  # def initial_procategory
  #   return Procategory.all.order(ddc: :asc).first
  # end

  # def find_father_at_level(father_level)
  #   return Procategory.where(["SUBSTR(ddc,1,?) = ? AND SUBSTR(ddc,?,1) = '0'", father_level + 1, self.ddc[0..(father_level)], father_level + 2 ]).first
  # end

end
