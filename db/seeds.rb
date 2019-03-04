# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

age_ranges = ["0-99","10-20","21-30","31-40","41-50","50+"]
group_ids = []

age_ranges.each do |range|
    group = AgeGroup.create(
        range: range
    )
    group_ids.push group.id
end

categories =["Adventure","Romance","Dining","Cake & Pastry","Film","Opera"]
category_ids =[]
categories.each do |cat|
    category = Category.create(
        category: cat
    )
    category_ids.push category.id
end

Keywords = ["Family dining Bar Beer", "Chicken Scenic Ocean","Family Chicken Beer","BBQ Bar", "Scenic BBQ"]

user_data = [
            ["santosh","poudyal","02/11/1993","santosh.poudyal@gmail.com","password","password",1234],
            ["blake","doyle","02/11/1993","blake.doyle@gmail.com","password","password",3456],
            ["tyson","hofstetter","02/11/1993","tyson.hofstetter@gmail.com","password","password",4567]
           ]

outer_counter =0
while outer_counter < user_data.length do
    inner_counter =0
    i=0
    while inner_counter < user_data[outer_counter].length
        User.create(
            first_name: user_data[outer_counter][i],
            last_name: user_data[outer_counter][i+1],
            date_of_birth: user_data[outer_counter][i+2],
            email: user_data[outer_counter][i+3],
            password: user_data[outer_counter][i+4],
            password_confirmation: user_data[outer_counter][i+5],
            post_code: user_data[outer_counter][i+6]
             )
        inner_counter +=1
        i=0
    end
    outer_counter +=1
end



30.times do 
    Product.create(
        name: Faker::Appliance.equipment,
        cost: Faker::Number.decimal(3,2),
        description: Faker::Lorem.paragraph(2), 
        active: true,
        keywords: Faker::Lorem.sentence,
        image: File.open(Rails.root + "app/assets/images/default.jpg"),
        # category: Faker::Appliance.brand,
        # keywords: "Adventure",
        user_id: 1,
        location: Faker::HarryPotter.location,
        age_group_id: group_ids[rand(group_ids.length)],
        category_id: category_ids[rand(category_ids.length)],
    )
end



   
   
  
