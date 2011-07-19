Factory.define(:event) do |event|
  event.begin_at DateTime.now
  event.link "http://www.example.com"
  event.location "Examplia"
  event.name "John Doe's B-Day Bash"
end

Factory.define(:last_month_event, :parent => :event) do |event|
  event.begin_at 1.month.ago
end

Factory.define(:next_month_event, :parent => :event) do |event|
  event.begin_at 1.month.from_now
end

