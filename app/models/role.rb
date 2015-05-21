class Role < ActiveRecord::Base
  has_many :assignments
  has_many :employees, through: :assignments
  belongs_to :role

  validates :description, presence: true
  validates :pid,         presence: true

  def child_employees_ids
    values = []

    if self.persisted?
      values = ActiveRecord::Base.connection.execute(child_employees_query).values.flatten!
      values.map!(&:to_i) if values.present?
    end

    values || []
  end

  def line_employees_ids
    values = Assignment.select(:employee_id).where(role_id: self.id)
    values.map(&:employee_id) || []
  end

private

  def child_employees_query
    %{
      WITH RECURSIVE role_tree(id, path) AS (
        SELECT id, ARRAY[id]
        FROM roles
        WHERE id = #{self.id}
        UNION ALL
          SELECT roles.id, path || roles.id
          FROM role_tree
          JOIN roles ON roles.role_id = role_tree.id
          WHERE NOT roles.id = ANY(path)
      )

      SELECT a.employee_id
      FROM assignments as a, role_tree as rt
      WHERE a.role_id = rt.id
    }
  end
end
