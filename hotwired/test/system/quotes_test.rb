require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  test "Creating a new quote" do 

    setup do 
      @quote = quotes(:first)
    end
    #When visiting the index page we expecto to see a name "Quotes"

    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "New quote"
    assert_selector "h1", text: "New quote"


    fill_in "Name", with; "Capybara Quote"
    click_on "Create quote"

    assert_selector "h1", text: "Quotes"

    assert_text "Capybara quote"
  end

  test "Showing a quote" do 
    visit quotes_path
    click_link @quotes_name

    assert_selector "h1", text: "Quotes"
  end
end
