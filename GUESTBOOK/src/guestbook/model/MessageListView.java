package guestbook.model;

import java.util.List;

public class MessageListView {

	private int messageTotalCount;
	private int currentPageNumber;
	private List<Message> messageList;
	private int pageTotalCount;
	private int messageCountPerPage;
	private int firstRow;
	
	
	
	
	public MessageListView(int messageTotalCount, int currentPageNumber, List<Message> messageList, int pageTotalCount,
			int messageCountPerPage, int firstRow) {
		this.messageTotalCount = messageTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.messageList = messageList;
		this.pageTotalCount = pageTotalCount;
		this.messageCountPerPage = messageCountPerPage;
		this.firstRow = firstRow;
	}


	public MessageListView(int messageTotalCount, int currentPageNumber, List<Message> messageList,
			int messageCountPerPage, int firstRow) {
	
		this.messageTotalCount = messageTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.messageList = messageList;
		this.messageCountPerPage = messageCountPerPage;
		this.firstRow = firstRow;
		calcuratePageTotalCount();
	}


	private void calcuratePageTotalCount() {
		if(messageTotalCount == 0) {
				pageTotalCount = 0;
		} else {
			pageTotalCount = messageTotalCount / messageCountPerPage;
			if (messageTotalCount % messageCountPerPage > 0) {
			pageTotalCount ++;		
			}
			
		}
	}


	public int getMessageTotalCount() {
		return messageTotalCount;
	}


	public int getCurrentPageNumber() {
		return currentPageNumber;
	}


	public List<Message> getMessageList() {
		return messageList;
	}


	public int getPageTotalCount() {
		return pageTotalCount;
	}


	public int getMessageCountPerPage() {
		return messageCountPerPage;
	}


	public int getFirstRow() {
		return firstRow;
	}
	
	
	public boolean isEmpty() {	return messageTotalCount == 0; }
	
	
	
}
