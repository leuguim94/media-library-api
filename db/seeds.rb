u1 = User.create({ email: 'the_good@domain.com' })
u2 = User.create({ email: 'the_bad@domain.com' })
u3 = User.create({ email: 'the_ugly@domain.com' })

Movie.create(
  [
    { title: 'Batman Begins', plot: 'Why do we fall?' },
    { title: 'Joker', plot: 'I used to think that my life was a tragedy' },
    { title: 'The Lion King', plot: 'I laugh in the face of danger' },
    { title: 'Star Wars', plot: 'In a galaxy far far away...' }
  ]
)

s1 = Season.create({ title: 'Breaking Bad', plot: 'This is not meth', number: 1 })
s2 = Season.create({ title: 'Game of Thrones', plot: 'You win or you die', number: 1 })
s3 = Season.create({ title: 'Friends', plot: 'We were on a break!', number: 1 })
s4 = Season.create({ title: 'The Simpsons', plot: "D'oh!", number: 1 })

Episode.create(
  [
    { title: 'Breaking Bad 1x01', plot: '1x01 plot', number: 1, season: s1 },
    { title: 'Breaking Bad 1x02', plot: '1x02 plot', number: 2, season: s1 },
    { title: 'Breaking Bad 1x03', plot: '1x03 plot', number: 3, season: s1 },
    { title: 'Game of Thrones 1x01', plot: '1x01 plot', number: 1, season: s2 },
    { title: 'Game of Thrones 1x02', plot: '1x02 plot', number: 2, season: s2 },
    { title: 'Game of Thrones 1x03', plot: '1x03 plot', number: 3, season: s2 },
    { title: 'Friends 1x01', plot: '1x01 plot', number: 1, season: s3 },
    { title: 'Friends 1x02', plot: '1x02 plot', number: 2, season: s3 },
    { title: 'Friends 1x03', plot: '1x03 plot', number: 3, season: s3 },
    { title: 'The Simpsons 1x01', plot: '1x01 plot', number: 1, season: s4 },
    { title: 'The Simpsons 1x02', plot: '1x02 plot', number: 2, season: s4 },
    { title: 'The Simpsons 1x03', plot: '1x03 plot', number: 3, season: s4 }
  ]
)

Purchase.create(
  [
    { user: u1, movie: Movie.first, quality: 0, price: 0.99 },
    { user: u1, movie: Movie.second, quality: 0, price: 1.99 },
    { user: u2, movie: Movie.first, quality: 1, price: 2.99 },
    { user: u2, movie: Movie.third, quality: 1, price: 3.99 },
    { user: u3, movie: Movie.second, quality: 1, price: 4.99 },
    { user: u3, movie: Movie.last, quality: 0, price: 5.99 },
    { user: u1, season: s1, quality: 0, price: 0.99 },
    { user: u1, season: s2, quality: 0, price: 1.99 },
    { user: u2, season: s1, quality: 1, price: 2.99 },
    { user: u2, season: s3, quality: 1, price: 3.99 },
    { user: u3, season: s2, quality: 1, price: 4.99 },
    { user: u3, season: s4, quality: 0, price: 5.99 }
  ]
)
