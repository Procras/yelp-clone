feature 'endorsing reviews' do
  before do
    kfc = Restaurant.create(name: 'kfc')
    kfc.reviews.create(rating: 3, thoughts: 'It was an abomination')
  end

  scenario 'a user can endorse a review, which updates the review endorsement counter' do
    visit '/restaurants'
    click_link 'Endorse Review'
    expect(page).to have_content('1 endorsement')
  end

  scenario 'correct endorsement count is displayed for each review' do
    mcdonalds = Restaurant.create(name: 'McDonalds')
    mcdonalds.reviews.create(rating: 4, thoughts: 'Drive through is great!')
    visit '/restaurants'
    within(:css, "div#McDonalds") do
      2.times { click_link "Endorse Review" }
    end
    expect(page).to have_content '2 endorsement'
  end

  scenario 'cannot leave an endorsement if no reviews', js: true do
    visit '/'
    expect(page).not_to have_link 'Endorse Review'
  end
end
