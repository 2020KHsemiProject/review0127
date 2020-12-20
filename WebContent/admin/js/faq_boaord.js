/**
 * 
 */

$(function() {

			var value = $('select option:selected').val();
			$('select[name=category]').val(value);

			$('.deleteFAQ').submit(
					function() {

						var inform = $(this).parents('tr').children().eq(2)
								.text();
						var $returnVal = window.confirm('[' + inform
								+ '] \\n 글을 삭제하겠습니까?');

						if ($returnVal) {
							return true;
						} else {
							return false;
						}

					})

			$('.restoreFAQ').submit(
					function() {

						var inform = $(this).parents('tr').children().eq(2)
								.text();
						var $returnVal = window.confirm('[' + inform
								+ '] \\n 글을 복구하겠습니까?');
						if ($returnVal) {
							return true;
						} else {
							return false;
						}

					})

			$allCheckbox = $('#all_select').children();

			$allCheckbox.click(function() {

				if ($allCheckbox.prop('checked') == true) {

					$('input:checkbox').prop('checked', true);

				} else {

					$('input:checkbox').prop('checked', false);
				}

			});

			$('#deleteFAQList').submit(
					function() {

						var $checkArr = new Array();

						$checkArr = $('input[name=delete-select]:checked');

						var whereQuery = "";

						$.each($checkArr, function(index, item) {

							if (index == 0) {

								whereQuery = "faq_no = " + $(item).val();

							} else {

								whereQuery = whereQuery + " or faq_no = "
										+ $(item).val();
							}

						});

						if (whereQuery == "") {

							return false;

						} else {

							if (confirm("선택된 글을 삭제하시겠습니까?") == true) {

								$('input[name=faqNoArr]').val(whereQuery);

								return true;

							} else {

								return false;
							}
						}

					});

		});