module SearchHelper
  def model_fields(object)
    object.column_names
  end

  def results_limit
    # max number of search results to display
    10
  end

  def display_results_header(count)
    if count > results_limit
      "Your first #{results_limit} results out of #{count} total"
    else
      "Your #{pluralize(count, 'result')}"
    end
  end

  def action
    action_name == 'advanced_search' ? :post : :get
  end

  def display_sort_column_headers(search)
    model_fields(search.klass).each_with_object('') do |field, string|
      if field == 'employee_id'
        string << content_tag(:th, sort_link(search, 'Employee: Service No/Rank/Name', {}, method: action))
      else
        string << content_tag(:th, sort_link(search, field, {}, method: action))
      end
    end
  end

  def display_search_results(objects)
    objects.limit(results_limit).each_with_object('') do |object, string|
      string << content_tag(:tr, display_search_results_row(object))
    end
  end

  def display_search_results_row(object)
    model_fields(object.class).each_with_object('') do |field, string|
      if field == 'employee_id'
        if object.employee.present?
          string << content_tag(:td, "#{object.employee.service_no}/#{object.employee.substantive_rank}/#{object.employee.last_name}")
        else
          content_tag(:td)
        end
      else
        string << content_tag(:td, object.send(field))
      end
    end
    .html_safe
  end
end
