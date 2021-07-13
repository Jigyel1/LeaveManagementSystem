class Notifications 
    constructor: ->
        @notifications = $("[data-behavior='notifications']")
        @setup() if @notifications.length > 0

        setup: ->
            $.ajax(
                url: "notifications.json"
                dataType: "JSON"
                method: "GET"
                success: @handleSuccess
            )

            handleSuccess: (data) =>
                items = $.map data, (notification) ->
                    "<a class='dropdown_item' href='#{notification.url}'>Your Leave has been #{notification.action}!</a>"
                    $("[data-behavior='notification-items']").html(items)
jQuery ->
    new Notifications