Sequel.migration do
  change do

    categories = [
      {
        :name => 'Education',
        :description => 'Events related to academic persuits.',
        :image_path => 'education.jpg'
      },
      {
        :name => 'Work',
        :description => 'Events related to jobs and careers.',
        :image_path => 'work.jpg'
      },
      {
        :name => 'Projects',
        :description => 'Events relating to projects of any nature, personal or business.',
        :image_path => 'projects.jpg'
      },
      {
        :name => 'Achievements',
        :description => 'Personal achievements, official or otherwise.',
        :image_path => 'achievements.jpg'
      },
      {
        :name => 'Life Events',
        :description => 'Personal life events - big or small.',
        :image_path => 'lifeevents.jpg'
      },
      {
        :name => 'Live & Social Events',
        :description => 'Live events like a game, concert, or a party!',
        :image_path => 'social.jpg'
      },
      {
        :name => 'Fitness & Health',
        :description => 'Physical activities like a sport or good workout, as well as  general health management.',
        :image_path => 'health.jpg'
      },
      {
        :name => 'Arts & Crafts',
        :description => 'Write up that armoire you built or that van Gogh you replicated!',
        :image_path => 'art.jpg'
      },
      {
        :name => 'TV & Film',
        :description => 'Watched a good movie? Finished a fascinating documentary? Write up your thoughts!',
        :image_path => 'film.jpg'
      },
      {
        :name => 'Books',
        :description => 'You bookworm, you.',
        :image_path => 'books.jpg'
      },
      {
        :name => 'Games',
        :description => 'Finished a good videogame? Had a great tabletop or boardgame session? Write it up!',
        :image_path => 'games.jpg'
      },
      {
        :name => 'Other',
        :description => 'Anything that doesn\'t fit any of the other categories!',
        :image_path => 'other.jpg'
      },
    ]

    categories.each do |c|
      self[:event_categories].insert(:name        => c[:name],
                                     :description => c[:description],
                                     :image_path  =>  c[:image_path])
    end
  end
end
