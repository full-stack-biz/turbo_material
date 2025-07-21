# frozen_string_literal: true

module MockDataHelper
  # Generate mock user data
  def self.users(count: 10)
    first_names = ['John', 'Jane', 'Bob', 'Alice', 'Charlie', 'Diana', 'Eve', 'Frank', 'Grace', 'Henry']
    last_names = ['Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Garcia', 'Miller', 'Davis', 'Rodriguez', 'Martinez']
    roles = ['Admin', 'User', 'Manager', 'Editor', 'Viewer']
    
    (1..count).map do |i|
      {
        id: i,
        first_name: first_names[(i - 1) % first_names.length],
        last_name: last_names[(i - 1) % last_names.length],
        email: "user#{i}@example.com",
        role: roles[(i - 1) % roles.length],
        active: i.odd?,
        created_at: Date.current - i.days
      }
    end
  end

  # Generate mock pagination object
  def self.pagy(page: 1, per_page: 10, total_count: 100)
    last_page = (total_count.to_f / per_page).ceil
    from = ((page - 1) * per_page) + 1
    to = [page * per_page, total_count].min
    
    OpenStruct.new(
      page: page,
      last: last_page,
      prev: page > 1 ? page - 1 : nil,
      next: page < last_page ? page + 1 : nil,
      from: from,
      to: to,
      count: total_count,
      items: per_page
    )
  end

  # Generate mock select options
  def self.select_options(type: :simple, count: 5)
    case type
    when :simple
      (1..count).map { |i| { label: "Option #{i}", value: "option_#{i}" } }
    when :countries
      countries = [
        { label: 'United States', value: 'US' },
        { label: 'Canada', value: 'CA' },
        { label: 'United Kingdom', value: 'GB' },
        { label: 'Germany', value: 'DE' },
        { label: 'France', value: 'FR' },
        { label: 'Japan', value: 'JP' },
        { label: 'Australia', value: 'AU' },
        { label: 'Brazil', value: 'BR' },
        { label: 'India', value: 'IN' },
        { label: 'China', value: 'CN' }
      ]
      countries.first(count)
    when :categories
      categories = ['Technology', 'Business', 'Design', 'Marketing', 'Finance', 'Operations', 'HR', 'Sales']
      categories.first(count).map { |cat| { label: cat, value: cat.downcase } }
    when :status
      [
        { label: 'Active', value: 'active' },
        { label: 'Inactive', value: 'inactive' },
        { label: 'Pending', value: 'pending' },
        { label: 'Suspended', value: 'suspended' }
      ].first(count)
    else
      []
    end
  end

  # Generate mock chip data
  def self.chips(type: :tags, count: 5)
    case type
    when :tags
      tags = ['Ruby', 'Rails', 'JavaScript', 'CSS', 'HTML', 'React', 'Vue', 'Angular', 'Node.js', 'Python']
      tags.first(count).map { |tag| { label: tag, value: tag.downcase.gsub('.', '') } }
    when :skills
      skills = ['Problem Solving', 'Communication', 'Leadership', 'Teamwork', 'Creativity', 'Time Management']
      skills.first(count).map { |skill| { label: skill, value: skill.downcase.gsub(' ', '_') } }
    when :departments
      depts = ['Engineering', 'Design', 'Marketing', 'Sales', 'HR', 'Finance', 'Operations', 'Support']
      depts.first(count).map { |dept| { label: dept, value: dept.downcase } }
    else
      (1..count).map { |i| { label: "Item #{i}", value: "item_#{i}" } }
    end
  end

  # Generate mock notification data
  def self.notifications(count: 5)
    types = ['info', 'success', 'warning', 'error']
    messages = [
      'Your profile has been updated successfully.',
      'New message from John Doe.',
      'System maintenance scheduled for tonight.',
      'Your subscription will expire in 3 days.',
      'Password changed successfully.'
    ]
    
    (1..count).map do |i|
      {
        id: i,
        type: types[(i - 1) % types.length],
        message: messages[(i - 1) % messages.length],
        timestamp: Time.current - (i * 2).hours,
        read: i.even?
      }
    end
  end
end