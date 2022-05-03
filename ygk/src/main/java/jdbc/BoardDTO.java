package jdbc;

public class BoardDTO {
	private String bid;
	private String uid;
	private String content;
	private String ts;
	private String images;
	private String videos;
	private String lat;
	private String lon;
	
	
	public String getBid() {
		return bid;
	}
	public String getUid() {
		return uid;
	}
	public String getContent() {
		return content;
	}
	public String getTs() {
		return ts;
	}
	public String getImages() {
		return images;
	}
	public String getVideos() {
		return videos;
	}
	public String getLat() {
		return lat;
	}
	public String getLon() {
		return lon;
	}
	
	
	public BoardDTO(String bid, String uid, String content, String ts, String images, String videos, String lat,
			String lon) {
		super();
		this.bid = bid;
		this.uid = uid;
		this.content = content;
		this.ts = ts;
		this.images = images;
		this.videos = videos;
		this.lat = lat;
		this.lon = lon;
	}

}
