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
		return Procategory.where(["ddc != ? AND SUBSTR(ddc,1,?) = ?", self.ddc, self.prefix_ddc.length, self.prefix_ddc]).order(ddc: :asc)
	end

	def father
		prefix_ddc = self.prefix_ddc
		father_prefix_ddc = prefix_ddc[0..(prefix_ddc.length-2)]
		if prefix_ddc.length == 1
			return nil
		else
			procateogry = Procategory.where(["SUBSTR(ddc,1,?) = ?", father_prefix_ddc.length,prefix_ddc[0..(prefix_ddc.length-2)]]).order(ddc: :asc).first
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
			if level = 2
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

  # def initial_procategory
  #   return Procategory.all.order(ddc: :asc).first
  # end

  # def find_father_at_level(father_level)
  #   return Procategory.where(["SUBSTR(ddc,1,?) = ? AND SUBSTR(ddc,?,1) = '0'", father_level + 1, self.ddc[0..(father_level)], father_level + 2 ]).first
  # end

end
