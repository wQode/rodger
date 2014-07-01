User.destroy_all
Document.destroy_all
Revision.destroy_all
Classification.destroy_all
Tag.destroy_all


u1 = User.create(:username => 'quma', :avatar => 'x', :password =>'password', :password =>'password')
u2 = User.create(:username => 'whyte', :avatar => 'x', :password =>'password', :password =>'password', :is_admin => true)
u3 = User.create(:username => 'rodgers', :avatar => 'x', :password =>'password', :password =>'password')

d1 = Document.create(:title => 'Quma Document')
d2 = Document.create(:title => 'Whyte Document')
d3 = Document.create(:title => 'Rodgers Document')

r1 = Revision.create(:title => 'Quma Revision 1')
r2 = Revision.create(:title => 'Whyte Revision 2')
r3 = Revision.create(:title => 'Rodgers Revision 3')

c1 = Classification.create(:title => 'Quma Document Title')
c2 = Classification.create(:title => 'Whyte Document Title')
c3 = Classification.create(:title => 'Rodgers Document Title')

t1 = Tag.create(:title => 'Quma Tag 1')
t2 = Tag.create(:title => 'Whyte Tag 2')
t3 = Tag.create(:title => 'Rodgers Tag 3')

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
