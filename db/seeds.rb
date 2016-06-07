Cohort.default_cohorts
Category.default_categories

r = Resource.create(name: "Remote Authentication", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe, quidem nam molestiae laboriosam deleniti itaque, hic asperiores voluptates aut quod cum, assumenda officiis, facere nostrum consectetur iure eveniet iste laudantium.", url: "https://medium.com/@kevin.r.webster/third-party-authentication-bb6aca7fee0c#.z60ktcm9b", category_id: 1, user_id: 1)
s = Resource.create(name: "Sick Blog", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe, quidem nam molestiae laboriosam deleniti itaque, hic asperiores voluptates aut quod cum, assumenda officiis, facere nostrum consectetur iure eveniet iste laudantium.", url: "https://google.com", category_id: 3, user_id: 1)
Resource.create(name: "Programming stuff", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe, quidem nam molestiae laboriosam deleniti itaque, hic asperiores voluptates aut quod cum, assumenda officiis, facere nostrum consectetur iure eveniet iste laudantium.", url: "https://google.com", category_id: 2, user_id: 1)
Resource.create(name: "Yeah", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe, quidem nam molestiae laboriosam deleniti itaque, hic asperiores voluptates aut quod cum, assumenda officiis, facere nostrum consectetur iure eveniet iste laudantium.", url: "https://google.com", category_id: 3, user_id: 3)
Resource.create(name: "Searching for Sugarman", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe, quidem nam molestiae laboriosam deleniti itaque, hic asperiores voluptates aut quod cum, assumenda officiis, facere nostrum consectetur iure eveniet iste laudantium.", url: "https://google.com", category_id: 5, user_id: 3)
Resource.create(name: "That thing from yesterday", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe, quidem nam molestiae laboriosam deleniti itaque, hic asperiores voluptates aut quod cum, assumenda officiis, facere nostrum consectetur iure eveniet iste laudantium.", url: "https://google.com", category_id: 4, user_id: 2)

r.tags << Tag.create(name: "Authentication")
s.tags << Tag.create(name: "")


