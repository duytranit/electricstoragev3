class Procategory < ActiveRecord::Base
  has_many :projects

	def level
	  ddc = self.ddc
	  ddc_length = ddc.length - 1
	  level = 0
	  (1..ddc_length).each do |flag|
		  level += 1 if ddc[flag] != '0'
	  end
		return level
  end

  def prefix_ddc
	  return ddc[0..(level)]
  end

	def children
		return Procategory.where(["DDC != ? AND SUBSTR(ddc,1,?) = ?", self.ddc, self.prefix_ddc.length, self.prefix_ddc])
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
      return Procategory.where(["SUBSTR(ddc,?,1) = ?", level + 2, '0'])
    else
      father = self.father
      return Procategory.where(["SUBSTR(ddc,?,1) = ? AND SUBSTR(ddc,1,?) = ? AND SUBSTR(ddc,?,1) != ?", level + 2, '0', level, self.ddc[0..(level - 1)], level + 1, father.ddc[level]])
    end

	end
end
