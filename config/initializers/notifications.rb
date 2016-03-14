ActiveSupport::Notifications.subscribe /process_action.action_controller/ do |name, start, finish, id, payload|
  Rails.logger.debug(["notification:", name, start, finish, id, payload].join(" "))
end

ActiveSupport::Notifications.subscribe "product.update" do |name, started, finished, unique_id, data|
  puts "-------------------------------"
  puts data.inspect # {search: :params}
end