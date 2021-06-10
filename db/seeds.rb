# Users

User.create(username: "Alex", email: "alex@gmail.com", password: "1234")
User.create(username: "John", email: "john@gmail.com", password: "1234")
User.create(username: "Noah", email: "noah@gmail.com", password: "1234")
User.create(username: "Olivia", email: "olivia@gmail.com", password: "1234")
User.create(username: "Emma", email: "emma@gmail.com", password: "1234")
User.create(username: "Oliver", email: "oliver@gmail.com", password: "1234")
User.create(username: "Sophia", email: "sophia@gmail.com", password: "1234")
User.create(username: "William", email: "william@gmail.com", password: "1234")


# Locations

Location.create(
  name: "Chicago",
  description: "Chicago, on Lake Michigan in Illinois, is among the largest cities in the U.S. Famed for its bold architecture, it has a skyline punctuated by skyscrapers such as the iconic John Hancock Center, 1,451-ft. Willis Tower (formerly the Sears Tower) and the neo-Gothic Tribune Tower. The city is also renowned for its museums, including the Art Institute of Chicago with its noted Impressionist and Post-Impressionist works.", 
  address: "Illinois, USA"
)
Location.create(
  name: "Boston",
  description: "Boston, officially the City of Boston, is the capital and most populous city of the Commonwealth of Massachusetts in the United States and 21st most populous city in the country. The city proper covers 48.4 square miles (125 km2) with an estimated population of 692,600 in 2019, also making it the most populous city in New England. It is the seat of Suffolk County (although the county government was disbanded on July 1, 1999). The city is the economic and cultural anchor of a substantially larger metropolitan area known as Greater Boston, a metropolitan statistical area (MSA) home to a census-estimated 4.8 million people in 2016 and ranking as the tenth-largest MSA in the country.", 
  address: "Massachusetts, USA"
)
Location.create(
  name: "Las Vegas",
  description: "Las Vegas, officially the City of Las Vegas and often known simply as Vegas, is the 28th-most populous city in the United States, the most populous city in the state of Nevada, and the county seat of Clark County. The city anchors the Las Vegas Valley metropolitan area and is the largest city within the greater Mojave Desert. Las Vegas is an internationally renowned major resort city, known primarily for its gambling, shopping, fine dining, entertainment, and nightlife. The Las Vegas Valley as a whole serves as the leading financial, commercial, and cultural center for Nevada.",
  address: "Nevada, USA"
)
Location.create(
  name: "New York",
  description: "New York City (NYC), often simply called New York, is the most populous city in the United States. With almost 20 million people in its metropolitan statistical area it is one of the world's most populous megacities. New York City has been described as the cultural, financial, and media capital of the world, significantly influencing commerce, entertainment, research, technology, education, politics, tourism, art, fashion, and sports, and is the most photographed city in the world. Home to the headquarters of the United Nations, New York is an important center for international diplomacy, and has sometimes been called the capital of the world.",
  address: "New York, USA"
)
Location.create(
  name: "San Francisco",
  description: "San Francisco, officially the City and County of San Francisco, is a cultural, commercial, and financial center in Northern California. San Francisco is the 16th most populous city in the United States, and the fourth most populous in California, with 881,549 residents as of 2019. It covers an area of about 46.89 square miles (121.4 square kilometers), mostly at the north end of the San Francisco Peninsula in the San Francisco Bay Area, making it the second most densely populated large U.S. city, and the fifth most densely populated U.S. county, behind only four of the five New York City boroughs.",
  address: "California, USA"
)


# Reviews

Review.create(
  content: "One of many must  visit sites  in Chicago.  A large variety of restaurants to choose from, plenty of shopping, a fun and friendly atmosphere.",
  rating: 3,
  attraction_id: 1,
  user_id: 12
)
Review.create(
  content: "Can take a while to get in on a busy day, so plan accordingly.",
  rating: 2,
  attraction_id: 1,
  user_id: 13
)
Review.create(
  content: "Lovely museum with an extensive collection of modern and contemporary art",
  rating: 5,
  attraction_id: 2,
  user_id: 10
)
Review.create(
  content: "This is where you go to see all the art you learned about in school.",
  rating: 4,
  attraction_id: 2,
  user_id: 11
)
Review.create(
  content: "Great place to watch a baseball game Home of the Boston Red Sox World Series Champions",
  rating: 5,
  attraction_id: 3,
  user_id: 14
)
Review.create(
  content: "Excellent concert venue as well as baseball!",
  rating: 3,
  attraction_id: 3,
  user_id: 15
)
Review.create(
  content: "This time I caught part of the guided tour which I highly recommend.",
  rating: 4,
  attraction_id: 4,
  user_id: 16
)
Review.create(
  content: "Permanent exhibit is thoughtful and inspiring and the JFK100 exhibit is very well done.",
  rating: 1,
  attraction_id: 4,
  user_id: 17
)
Review.create(
  content: "The park offers many different hiking trails ranging from easy to difficult.",
  rating: 5,
  attraction_id: 5,
  user_id: 10
)
Review.create(
  content: "Make sure to stop at the visitor center first.",
  rating: 5,
  attraction_id: 5,
  user_id: 11
)
Review.create(
  content: "They have multiple stages with live music and sometimes DJs playing dance music.",
  rating: 1,
  attraction_id: 6,
  user_id: 12
)
Review.create(
  content: "Inside the casinos there is table games as well as slot machines.",
  rating: 2,
  attraction_id: 6,
  user_id: 13
)
Review.create(
  content: "Central Park in New York City is one of many iconic landmark parks in town.",
  rating: 4,
  attraction_id: 7,
  user_id: 14
)
Review.create(
  content: "It has an amusement park rides for kids, zoo and more which I didn't get a chance to discover",
  rating: 5,
  attraction_id: 7,
  user_id: 15
)
Review.create(
  content: "You can take a cruise boat ride on the island of liberty.",
  rating: 3,
  attraction_id: 8,
  user_id: 16
)
Review.create(
  content: "I didn't realize there was a free self-guided audio tour included.",
  rating: 5,
  attraction_id: 8,
  user_id: 17
)
Review.create(
  content: "After visiting Lombard we went to Golden Gate and the port, good luck visiting San Francisco!",
  rating: 5,
  attraction_id: 9,
  user_id: 10
)
Review.create(
  content: "Consider to go at the spings so you can see the flower",
  rating: 2,
  attraction_id: 9,
  user_id: 11
)
Review.create(
  content: "How could someone miss Golden Gate bridge while visiting San Francisco or bay area.",
  rating: 1,
  attraction_id: 10,
  user_id: 12
)
Review.create(
  content: "Take a walk or a bike ride along the bridge.",
  rating: 5,
  attraction_id: 10,
  user_id: 13
)


# Attractions

Attraction.create(
  name: "Navy Pier",
  description: "Navy Pier is a 3,300-foot-long pier on the shoreline of Lake Michigan, located in the Streeterville neighborhood of the Near North Side community area in Chicago, Illinois, United States. Navy Pier encompasses over 50 acres of parks, gardens, shops, restaurants, family attractions and exhibition facilities and is one of the top destinations in the Midwestern United States, drawing nearly two million visitors annually. It is one of the most visited attractions in the entire Midwest and is Chicago's second most visited tourist attraction. ", 
  location_id: 1,
  user_id: 10
)
Attraction.create(
  name: "The Art Institute of Chicago", 
  description: "Equal parts museum and academic institution, The Art Institute of Chicago has been a fixture on the creative landscape since its founding by a group of artists in 1879. With a famous pair of bronze lions standing sentry, the not-for-profit organization's museum houses some 300,000 works of art in a dozen collections ranging from Asian art to architecture to textiles. The Art Institute of Chicago is also home to the Ryerson and Burnham Libraries, which together constitute one of the world's largest art museum libraries.", 
  location_id: 1,
  user_id: 10
)
Attraction.create(
  name: "Fenway Park",
  description: "Fenway Park is a baseball park located in Boston, Massachusetts, near Kenmore Square. Since 1912, it has been the home for the Boston Red Sox, the city's American League baseball team, and since 1953, its only Major League Baseball franchise. While the stadium was built in 1912, it was rebuilt in 1934. It is the oldest active ballpark in MLB. Because of its age and constrained location in Boston's dense Fenway–Kenmore neighborhood, the park has been renovated or expanded many times, resulting in quirky features including 'The Triangle', Pesky's Pole, and the Green Monster in left field. It is the fifth-smallest among MLB ballparks by seating capacity, second-smallest by total capacity, and one of eight that cannot accommodate at least 40,000 spectators. Fenway has hosted the World Series 11 times, with the Red Sox winning six of them and the Boston Braves winning one. Besides baseball games, it has also been the site of many other sporting and cultural events including professional football games for the Boston Redskins, Boston Yanks, and the New England Patriots; concerts; soccer and hockey games; and political and religious campaigns.", 
  location_id: 2,
  user_id: 11
)
Attraction.create(
  name: "John F. Kennedy Presidential Library and Museum",
  description: "The John F. Kennedy Presidential Library and Museum is the presidential library and museum of John Fitzgerald Kennedy, the 35th President of the United States. It is located on Columbia Point in the Dorchester neighborhood of Boston, Massachusetts, next to the University of Massachusetts at Boston, the Edward M. Kennedy Institute for the United States Senate, and the Massachusetts Archives and Commonwealth Museum. Designed by the architect I. M. Pei, the building is the official repository for original papers and correspondence of the Kennedy Administration, as well as special bodies of published and unpublished materials, such as books and papers by and about Ernest Hemingway. The library and museum is part of the Presidential Library System, which is administered by the Office of Presidential Libraries, a part of the National Archives and Records Administration. The library and Museum were dedicated in 1979 by 39th President Jimmy Carter and members of the Kennedy family. It can be reached from nearby Interstate 93 or via shuttle bus or walk from the JFK/UMass stop on the Boston Subway's Red Line.", 
  location_id: 2,
  user_id: 12
)
Attraction.create(
  name: "Red Rock Canyon National Conservation Area",
  description: "The Red Rock Canyon National Conservation Area in Clark County, Nevada, is an area managed by the Bureau of Land Management as part of its National Landscape Conservation System, and protected as a National Conservation Area. It is about 15 miles west of Las Vegas, and is easily seen from the Las Vegas Strip. More than three million people visit the area each year. The conservation area showcases a set of large red rock formations: a set of sandstone peaks and walls which were formed by thrust faults including the Keystone Thrust. The walls are up to 3,000 feet high, making them a popular hiking and rock climbing destination. The highest point is La Madre Mountain, at 8,154 feet. A one-way loop road, 13 miles long, provides vehicle access to many of the features in the area. Several side roads and parking areas allow access to many of the area trails. A visitor center is at the start of the loop road. The loop road is also popular for bicycle touring; it begins with a moderate climb, then is mostly downhill or flat.", 
  location_id: 3,
  user_id: 13
)
Attraction.create(
  name: "Fremont Street Experience", 
  description: "The Fremont Street Experience is a pedestrian mall and attraction in downtown Las Vegas, Nevada. The FSE occupies the westernmost five blocks of Fremont Street, including the area known for years as 'Glitter Gulch', and portions of some other adjacent streets. The central attraction is a barrel vault canopy, 90 ft high at the peak and four blocks, or approximately 1,375 ft, in length. While Las Vegas is known for never turning the outside casino lights off, each show begins by turning off the lights on all of the buildings, including the casinos, under the canopy. Before each show, one bidirectional street that crosses the Experience is blocked off for safety reasons. Concerts, usually free, are also held on three stages. The venue has become a major tourist attraction for downtown Las Vegas, and is also the location of the SlotZilla zip line attraction and the city's annual New Year's Eve party, complete with fireworks on the display screen.", 
  location_id: 3,
  user_id: 13
)
Attraction.create(
  name: "Central Park",
  description: "Central Park is an urban park in New York City located between the Upper West and Upper East Sides of Manhattan. It is the fifth-largest park in the city by area, covering 843 acres. It is the most visited urban park in the United States, with an estimated 42 million visitors annually as of 2016, and is the most filmed location in the world. Following proposals for a large park in Manhattan during the 1840s, it was approved in 1853 to cover 778 acres. In 1857, landscape architects Frederick Law Olmsted and Calvert Vaux won a design competition for the park with their 'Greensward Plan'. Construction began the same year; existing structures, including a majority-Black settlement named Seneca Village, were seized through eminent domain and razed. The park's first areas were opened to the public in late 1858. Additional land at the northern end of Central Park was purchased in 1859, and the park was completed in 1876. After a period of decline in the early 20th century, New York City parks commissioner Robert Moses started a program to clean up Central Park in the 1930s.", 
  location_id: 4,
  user_id: 13
)
Attraction.create(
  name: "Statue of Liberty National Monument",
  description: "The Statue of Liberty is a colossal neoclassical sculpture on Liberty Island in New York Harbor within New York City, in the United States. The copper statue, a gift from the people of France to the people of the United States, was designed by French sculptor Frédéric Auguste Bartholdi and its metal framework was built by Gustave Eiffel. The statue was dedicated on October 28, 1886. The statue is a figure of Libertas, a robed Roman liberty goddess. She holds a torch above her head with her right hand, and in her left hand carries a tabula ansata inscribed JULY IV MDCCLXXVI, the date of the U.S. Declaration of Independence. A broken shackle and chain lie at her feet as she walks forward, commemorating the recent national abolition of slavery. After its dedication, the statue became an icon of freedom and of the United States, seen as a symbol of welcome to immigrants arriving by sea. Bartholdi was inspired by a French law professor and politician, Édouard René de Laboulaye, who is said to have commented in 1865 that any monument raised to U.S. independence would properly be a joint project of the French and U.S. peoples.", 
  location_id: 4,
  user_id: 14
)
Attraction.create(
  name: "Lombard Street",
  description: "Lombard Street is an east–west street in San Francisco, California that is famous for a steep, one-block section with eight hairpin turns. Stretching from The Presidio east to The Embarcadero, most of the street's western segment is a major thoroughfare designated as part of U.S. Route 101. The famous one-block section, claimed to be 'the crookedest street in the world', is located along the eastern segment in the Russian Hill neighborhood. It is a major tourist attraction, receiving around two million visitors per year and up to 17,000 per day on busy summer weekends, as of 2015. San Francisco surveyor Jasper O'Farrell named the road after Lombard Street in Philadelphia.", 
  location_id: 5,
  user_id: 10
)
Attraction.create(
  name: "Golden Gate Bridge",
  description: "The Golden Gate Bridge is a suspension bridge spanning the Golden Gate, the one-mile-wide strait connecting San Francisco Bay and the Pacific Ocean. The structure links the U.S. city of San Francisco, California—the northern tip of the San Francisco Peninsula—to Marin County, carrying both U.S. Route 101 and California State Route 1 across the strait. The bridge is one of the most internationally recognized symbols of San Francisco and California. It was initially designed by engineer Joseph Strauss in 1917. It has been declared one of the Wonders of the Modern World by the American Society of Civil Engineers. The Frommer's travel guide describes the Golden Gate Bridge as 'possibly the most beautiful, certainly the most photographed, bridge in the world.' At the time of its opening in 1937, it was both the longest and the tallest suspension bridge in the world, with a main span of 4,200 feet and a total height of 746 feet.", 
  location_id: 5,
  user_id: 10
)

