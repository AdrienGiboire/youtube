require 'helper'

# TODO: skipped tests are to return once this is solved:
# https://issuetracker.google.com/issues/380898783
#
# And remove the "associated" tests using playlistId

describe Youtube::API::PlaylistItems do

  before do
    @client = Youtube::Client.new(developer_key: ENV['YOUTUBE_DEVELOPER_KEY'])
  end

  describe '#list' do
    it "returns a PlaylistItems by id" do
      playlist_items = @client.playlist_items(playlistId: 'FLMmADDDgI-dXaPGoIZ3qIsQ')
      expect(playlist_items).to be_a Youtube::PlaylistItems
    end
    skip "returns a PlaylistItems by id" do
      playlist_items = @client.playlist_items(id: 'FLMmADDDgI-dXaPGoIZ3qIsQ')
      expect(playlist_items).to be_a Youtube::PlaylistItems
    end

    it "next_page_token returns nil when passing an id" do
      playlist_items = @client.playlist_items(playlistId: 'FLMmADDDgI-dXaPGoIZ3qIsQ')
      expect(playlist_items.next_page_token).to be_nil
    end
    skip "next_page_token returns nil when passing an id" do
      playlist_items = @client.playlist_items(id: 'FLMmADDDgI-dXaPGoIZ3qIsQ')
      expect(playlist_items.next_page_token).to be_nil
    end

    it "video_ids returns an array of one string when passing an id" do
      playlist_items = @client.playlist_items(playlistId: 'FLMmADDDgI-dXaPGoIZ3qIsQ')
      expect(playlist_items.video_ids.count == 6).to be true
    end
    skip "video_ids returns an array of one string when passing an id" do
      playlist_items = @client.playlist_items(id: 'FLMmADDDgI-dXaPGoIZ3qIsQ')
      expect(playlist_items.video_ids.count == 6).to be true
    end

    it "returns PlaylistItems for playlistId" do
      playlist_items = @client.playlist_items(playlistId: 'UUzzyzxDOgrMBgwPDoXs8R4g')
      expect(playlist_items).to be_a Youtube::PlaylistItems
    end

    it "video_ids returns an array of two string when passing a playlistId and maxResults 2" do
      playlist_items = @client.playlist_items(playlistId: 'UUzzyzxDOgrMBgwPDoXs8R4g', maxResults: 2)
      expect(playlist_items.video_ids.count == 2).to be true
    end

    it "next_page_token returns a string when passing a playlistId and maxResults 2" do
      playlist_items = @client.playlist_items(playlistId: 'UUzzyzxDOgrMBgwPDoXs8R4g', maxResults: 2)
      expect(playlist_items.next_page_token).to be_a String
    end

    it "video_ids returns an array of two string when passing a playlistId and maxResults 2 with next_page_token" do
      playlist_items = @client.playlist_items(playlistId: 'UUzzyzxDOgrMBgwPDoXs8R4g', maxResults: 2)
      playlist_items_page_2 = @client.playlist_items(playlistId: 'UUzzyzxDOgrMBgwPDoXs8R4g', maxResults: 2, nextPageToken: playlist_items.next_page_token)
      expect(playlist_items_page_2.video_ids.count == 2).to be true
    end

    it "video_ids returns an array of string" do
      playlist_items = @client.playlist_items(playlistId: 'FLMmADDDgI-dXaPGoIZ3qIsQ')
      expect(playlist_items.video_ids).to be_an Array
      expect(playlist_items.video_ids.first).to be_a String
    end
    skip "video_ids returns an array of string" do
      playlist_items = @client.playlist_items(id: 'FLMmADDDgI-dXaPGoIZ3qIsQ')
      expect(playlist_items.video_ids).to be_an Array
      expect(playlist_items.video_ids.first).to be_a String
    end

    it "videos returns an array of Youtube::Video objects" do
      playlist_items = @client.playlist_items(playlistId: 'FLMmADDDgI-dXaPGoIZ3qIsQ')
      expect(playlist_items.videos).to be_an Array
      expect(playlist_items.videos.first).to be_a Youtube::Video
    end
    skip "videos returns an array of Youtube::Video objects" do
      playlist_items = @client.playlist_items(id: 'FLMmADDDgI-dXaPGoIZ3qIsQ')
      expect(playlist_items.videos).to be_an Array
      expect(playlist_items.videos.first).to be_a Youtube::Video
    end

    skip 'video_ids returns empty array if bad id passed' do
      playlist_items = @client.playlist_items(id: 'not-valid-id')
      expect(playlist_items.video_ids).to be_empty
    end
  end

end
