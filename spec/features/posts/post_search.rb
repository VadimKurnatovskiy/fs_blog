RSpec.describe FindPosts do
  let(:initial_scope) { Post.all }

  let(:search) { string 'some' }
  let(:empty_params) { {} }
  let(:params) { [:search, :order, :page] }
  empty_subject { described_class.new(initial_scope).call(empty_params) }
  subject { described_class.new(initial_scope).call(params)}

  context 'with empty params' do

    it 'search' do
      expect(empty_subject.to_sql).to include('SELECT  "posts".* FROM "posts" WHERE (title LIKE %% OR content SIMILAR TO %%)')
    end

    it 'order' do
      expect(empty_subject.to_sql).to include('ORDER BY "posts"."created_at" DESC')
    end

    it 'paginates' do
      expect(empty_subject.to_sql).to include('LIMIT')
      expect(empty_subject.to_sql).to include('OFFSET')
    end
  end
  context "with parameters" do

    it 'search' do
      expect(subject.to_sql).to include('SELECT  "posts".* FROM "posts" WHERE (title LIKE some OR content SIMILAR TO some)')
    end

    it 'order' do
      expect(subject.to_sql).to include('ORDER BY "posts"."created_at" DESC')
    end

    it 'paginates' do
      expect(subject.to_sql).to include('LIMIT')
      expect(subject.to_sql).to include('OFFSET')
    end
  end
end
