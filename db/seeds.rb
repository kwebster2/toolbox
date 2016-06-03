# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create(name: "Rails", cohort_id: 1)
Category.create(name: "JavaScript", cohort_id: 1)
Category.create(name: "jQuery", cohort_id: 1)

Subject.create(name: "Authentication", category_id: 1)
Subject.create(name: "Objects", category_id: 2)
Subject.create(name: "Animations", category_id: 3)

Resource.create(name: "Remote Authentication", url: "https://medium.com/@kevin.r.webster/third-party-authentication-bb6aca7fee0c#.z60ktcm9b", subject_id: 1)
Resource.create(name: "Sick Blog", url: "https://google.com", subject_id: 3)

Cohort.create(name: "Web Development")
Cohort.create(name: "iOS")
