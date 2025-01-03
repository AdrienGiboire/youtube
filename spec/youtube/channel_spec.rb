require 'helper'

describe Youtube::Channel do

  before do
    @client = Youtube::Client.new(developer_key: ENV['YOUTUBE_DEVELOPER_KEY'])
    @channel = @client.channel(id: 'UCMmADDDgI-dXaPGoIZ3qIsQ')
  end

  describe 'channel response' do
    it 'returns true' do
      @channel = @client.channel(id: 'UCMmADDDgI-dXaPGoIZ3qIsQ')
      expect(@channel.valid_item?).to be true
    end
  end

  describe 'channel' do
    it 'returns nil' do
      @channel = @client.channel(id: 'not-valid-id')
      expect(@channel).to be_nil
    end
  end

  describe '#exists?' do
    it 'returns true' do
      expect(@channel.exists?).to be true
    end
  end

  describe '#id' do
    it 'returns a String' do
      expect(@channel.id).to be_a String
    end
    it 'returns UCMmADDDgI-dXaPGoIZ3qIsQ' do
      expect(@channel.id == 'UCMmADDDgI-dXaPGoIZ3qIsQ').to be true
    end
  end

  describe '#title' do
    it 'returns a String' do
      expect(@channel.title).to be_a String
    end
    it "returns 'brandedchanneldemo'" do
      expect(@channel.title == 'brandedchanneldemo').to be true
    end
  end

  describe '#custom_url' do
    before do
      @channel = @client.channel(id: 'UCS_7tplUgzJG4DhA16re5Yg')
    end
    it 'returns a String' do
      expect(@channel.custom_url).to be_a String
    end
    it "returns 'BaladeMentaleChaine'" do
      expect(@channel.custom_url == '@baladementale').to be true
    end
  end

  describe '#description' do
    it 'returns a String' do
      expect(@channel.description).to be_a String
    end
    it "returns 'This channel is a demo for brand channels.'" do
      expect(@channel.description == 'This channel is a demo for brand channels.').to be true
    end
  end

  describe '#published_at' do
    it 'returns a Time' do
      expect(@channel.published_at).to be_a Time
    end
  end

  describe '#published_at 1970-01-01 00:00:00 UTC' do
    before do
      @channel = @client.channel(id: 'UCBR8-60-B28hp2BmDPdntcQ')
    end
    it 'returns 1970-01-01 00:00:00 UTC when published at not provided' do
      expect(@channel.published_at == Time.parse('1970-01-01 00:00:00 UTC')).to be true
    end
  end

  describe '#thumbnails' do
    before do
      @channel = @client.channel(id: 'UCLCmJiSbIoa_ZFiBOBDf6ZA')
    end
    it 'returns a Hash' do
      expect(@channel.thumbnails).to be_a Hash
    end
  end

  describe '#views_count' do
    it 'returns an Integer' do
      expect(@channel.views_count).to be_an Integer
    end
  end

  describe '#videos_count' do
    it 'returns an Integer' do
      expect(@channel.videos_count).to be_an Integer
    end
  end

  describe '#subscribers_count' do
    it 'returns an Integer' do
      expect(@channel.subscribers_count).to be_an Integer
    end
  end

  describe '#hidden_subscriber_count' do
    it 'returns false' do
      expect(@channel.hidden_subscriber_count).to be false
    end
  end

  describe '#comments_count' do
    it 'returns an Integer' do
      expect(@channel.comments_count).to be_an Integer
    end
  end

  describe '#keywords' do
    before do
      @channel = @client.channel(id: 'UCLCmJiSbIoa_ZFiBOBDf6ZA')
    end
    it 'returns a String' do
      expect(@channel.keywords).to be_a String
    end
  end

  describe '#featured_channels_urls' do
    it 'returns an Aray' do
      expect(@channel.featured_channels_urls).to be_an Array
    end
  end

  describe '#branding_settings' do
    before do
      @channel = @client.channel(id: 'UCxWZOgyYlE3LSmkGiqJRkDg')
    end
    it 'returns a Hash' do
      expect(@channel.branding_settings).to be_a Hash
    end
  end

  describe '#related_playlists' do
    before do
      @channel = @client.channel(id: 'UCzzyzxDOgrMBgwPDoXs8R4g')
    end
    it 'returns a Hash' do
      expect(@channel.related_playlists).to be_a Hash
    end
  end

  describe '#country' do
    before do
      @channel = @client.channel(id: 'UC99LgIedzGD1GirhFGldfUQ')
    end
    it 'returns a String' do
      expect(@channel.country).to be_a String
    end
  end

end
