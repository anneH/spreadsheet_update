require 'bundler'
Bundler.require
# Authenticate a session with your Service Account

session = GoogleDrive::Session.from_service_account_key("client_secret.json")

# Get the spreadsheet by its title
spreadsheet = session.spreadsheet_by_title("ruby-google-test")
# Get the first worksheet
worksheet = spreadsheet.worksheets.first
# Print out the first 6 columns of each row
# worksheet.rows.each { |row| puts row.first(6).join(" | ") }
# worksheet.insert_rows(2, [["Hello!", "This", "was", "inserted", "via", "Ruby"]])
# worksheet.save

start_times= ['2020-11-21T11:00:00.000-0700', '2020-11-22T13:01:00.000-0700', '2020-11-23T08:01:00.000-0700']
end_times = ['2020-11-21T12:00:00.000-0700', '2020-11-22T13:30:00.000-0700', '2020-11-23T15:00:00.000-0700']

start_row = 1
start_times.each do |start_time|
    start_row += 1
    worksheet[start_row, 1] = start_time
end    

end_row=1
end_times.each do |end_time|
    end_row += 1
    worksheet[end_row, 2] = end_time
end 

worksheet.save
