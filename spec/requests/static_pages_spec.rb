require 'spec_helper'

describe "StaticPages" do

	let(:base_title) { "Ruby on Rails Tutorial Sample App" }

	describe "Home page" do
		it "should have the content 'Sample App'" do
			visit '/static_pages/home'
			expect(page).to have_content('Sample App')
		end
		it "Should have the base title" do
			visit '/static_pages/home'
			expect(page).to have_title("Ruby on Rails Tutorial Sample App")
		end
		it "Should not have a customer page title" do
			visit '/static_pages/home'
			expect(page).not_to have_title('| Home')
		end
	end

	describe "Help Page" do
		it "Should have the content 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_content("Help")
		end
		it "Should have the title 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_title("#{base_title} | Help")
		end
	end

	describe "About Page" do
		it "Should have the content 'About Us'" do
			visit '/static_pages/about'
			expect(page).to have_content("About Us")
		end
		it "Should have the title 'About Us'" do
			visit '/static_pages/about'
			expect(page).to have_title("#{base_title} | About Us")
		end
	end

	describe "Contact Page" do
		it "Should have the content 'Contact'" do
			visit '/static_pages/contact'
			expect(page).to have_content("Contact")
		end
		it "Should have the title 'Contact Us'" do
			visit '/static_pages/contact'
			expect(page).to have_title("#{base_title} | Contact")
		end
	end

end
