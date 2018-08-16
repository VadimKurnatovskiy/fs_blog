RSpec.describe FindPosts do
  let(:initial_scope) { Post.all }

  let(:params) { {} }

  subject { described_class.new(initial_scope).call(params) }

  context 'with empty params' do

    it 'search' do
      expect(subject.to_sql).to include('title LIKE OR content LIKE')
    end

    it 'sort' do
      expect(subject.to_sql).to include('ORDER BY "posts"."created_at" DESC LIMIT 7 OFFSET 0')
    end

    it 'paginates' do
      expect(subject.to_sql).to include('LIMIT')
      expect(subject.to_sql).to include('OFFSET')
    end
  end
end
