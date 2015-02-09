class Role < ActiveRecord::Base
    has_ancestry
    ROLES = %i[top_corridor line_manager employee]
    has_many :assignments
    has_many :employees, :through => :assignments
    
    def self.arrange_as_array(options={}, hash=nil)                                                                                                                                                            
        hash ||= arrange(options)
    
        arr = []
            hash.each do |node, children|
              arr << node
              arr += arrange_as_array(options, children) unless children.nil?
            end
        arr
    end
    
    def role_details
        :description + " " + :PID
    end
    
    def name_for_selects
        "#{'-' * depth} #{name}"
    end

    def possible_parents
        parents = Role.arrange_as_array(:order => 'PID')
        return new_record? ? parents : parents - subtree
    end
end
