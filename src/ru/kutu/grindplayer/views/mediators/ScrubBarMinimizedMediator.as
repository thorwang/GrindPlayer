package ru.kutu.grindplayer.views.mediators {

	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	import ru.kutu.grind.config.PlayerConfiguration;
	import ru.kutu.grind.events.AutoHideEvent;
	import ru.kutu.grindplayer.views.mediators.api.IScrubBarMinimized;

	public class ScrubBarMinimizedMediator extends Mediator {
		
		[Inject] public var injector:Injector;
		[Inject] public var view:IScrubBarMinimized;
		
		override public function initialize():void {
			super.initialize();
			var configuration:PlayerConfiguration = injector.getInstance(PlayerConfiguration);
			addContextListener(AutoHideEvent.SHOW, onAutoHide, AutoHideEvent);
			addContextListener(AutoHideEvent.HIDE, onAutoHide, AutoHideEvent);
			dispatch(new AutoHideEvent(AutoHideEvent.REPEAT_PLEASE));
		}

		private function onAutoHide(event:AutoHideEvent):void {
			view.minimize(event.type == AutoHideEvent.HIDE);
		}

	}

}
