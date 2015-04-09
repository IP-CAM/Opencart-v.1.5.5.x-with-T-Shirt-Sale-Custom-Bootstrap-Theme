<?php  
class ControllerModuleNews extends Controller {
	protected function index() {
		$this->language->load('module/news');
		$this->load->model('extension/news');
		
		$data = array(
			'page' => 1,
			'limit' => 5,
			'start' => 0,
		);
	 	 
		$this->document->setTitle($this->language->get('heading_title')); 
		
		$this->document->addScript('catalog/view/javascript/jquery/jquery.ias.min.js');		
	 	$this->document->addScript('catalog/view/javascript/jquery/jquery.isotope.js');		
		
		$pagination = new Pagination();
		
		//$pagination->total = $total;
		//$pagination->page = $page;
		//$pagination->limit = 10;
		//$pagination->links = "nextpage";
		//$pagination->text = $this->language->get('text_pagination');
		//$pagination->url = $this->url->link('information/news', $url . '&page={page}', 'SSL');
		
		$this->data['pagination'] = $pagination->render();
		
		$all_news = $this->model_extension_news->getAllNews($data);
	 
		$this->data['all_news'] = array();
	 
foreach ($all_news as $news) {
			preg_match_all('/<img[^>]+>/i',html_entity_decode($news['description']), $images);
			$image = $images[0];
						
			preg_match_all('#<iframe(.*?)></iframe>#is',html_entity_decode($news['description']), $videos);
			$videos = $videos[0];
			
			$cover = '';
			
			if (!empty($image)){
				$cover = '<div class="img-news img-thumbnail">';
				$cover .= '<a href="'.$this->url->link('information/news/news', 'news_id=' . $news['news_id']).'" title="'.$news['title'].'">';
			    $cover .= $image[0];
		        $cover .= '</a>';
				$cover .= '</div>';
			} else if(!empty($videos)) {
				$cover = '<div class="format-video"><div id="player" class="player">';
				$cover .= $videos[0];
				$cover .= '</div></div>';
			}

			$this->data['all_news'][] = array (
				'title' => $news['title'],												
				'cover' => $cover,
				'description' => (strlen(strip_tags(html_entity_decode($news['description']),"\n\r\x00..\x1F&nbsp;")) > 300 ? substr(strip_tags(html_entity_decode($news['description'])), 0, 140) . '...' : strip_tags(html_entity_decode($news['description']))),
				'view' => $this->url->link('information/news/read', 'news_id=' . $news['news_id']),
				'date_added' => date('d M Y', strtotime($news['date_added']))
			);
		}
	 
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/news.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/news.tpl';
		} else {
			$this->template = 'default/template/module/news.tpl'; 
		}
		
		$this->render();
	}
}
?>