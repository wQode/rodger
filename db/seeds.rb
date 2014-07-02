User.destroy_all
Document.destroy_all
Revision.destroy_all
Classification.destroy_all
Tag.destroy_all


u1 = User.create(:username => 'quma', :avatar => 'x', :password =>'123', :password =>'123')
u2 = User.create(:username => 'whyte', :avatar => 'x', :password =>'123', :password =>'123', :is_admin => true)
u3 = User.create(:username => 'rodgers', :avatar => 'x', :password =>'123', :password =>'123')

d1 = Document.create(:title => 'Boeing planes')
d2 = Document.create(:title => 'Cats')
d3 = Document.create(:title => 'Stars')

d1 = Document.append(:content => 'Boeing planes can fly really fast')
d2 = Document.append(:content => 'Cats are furry little balls')
d3 = Document.append(:content => 'Stars shine so bright')

r1 = Revision.create(:title => 'Revision 1')
r2 = Revision.create(:title => 'Revision 2')
r3 = Revision.create(:title => 'Revision 3')

c1 = Classification.create(:title => 'Aviation')
c2 = Classification.create(:title => 'Animals')
c3 = Classification.create(:title => 'Astronomy')

d1.revisions << r1
d1.classification = c1
d1.tags << t1 << t2
u1.documents << d1

d2.revisions << r2
d2.classification = c2
d2.tags << t2
u2.documents << d2

d3.revisions << r2
d3.classification = c3
d3.tags << t1 << t3
u3.documents << d3
