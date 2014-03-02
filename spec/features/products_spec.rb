require 'spec_helper'

feature "Product Management" do
  scenario "creating a new product" do
    sign_in_admin

    expect {
      click_on 'Admin'
      click_link 'New Product'
      fill_in 'Title', with: "Awesome T Shirt"
      fill_in 'Description', with: "Will get you plenty of tail"
      attach_file 'Image', "#{Rails.root}/spec/fixtures/files/img_01.jpg"
      click_button 'Create Product'
    }. to change(Product, :count).by 1
  end

  scenario "viewing a new product" do
    sign_in_admin
    product = create :product_w_images

    visit product_path(product)
    within 'h2' do
      expect(page).to have_content "Awesome T Shirt"
    end
    within '#description' do
      expect(page).to have_content "Lorem Lorem Lorem"
    end
    within '#images' do
      expect(page).to have_css('img')
    end
  end

  scenario "editing a product" do
    sign_in_admin
    product = create :product_w_images

    visit product_path(product)

    find_link('edit').click
    expect(page.find_field('Title').value).to eq product.title
    expect(find_link("Back to #{product.title}"))
    within 'form' do
      expect(page.all(:css, 'img').count).to eq 3
    end
  end

  scenario "deleting a product", :js => true do
    sign_in_admin
    product = create :product
    product2 = create :product

    visit product_path(product)

    find_link('delete').click
    expect {
      page.driver.accept_js_confirms!
    }.to change(Product, :count).by -1
  end
end
