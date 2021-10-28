/**
 * @description       : This is a test LWC to demo the fetching of a custom label dynamically
 * @author            : chayanbatabyal@gmail.com
 * @last modified on  : 10-28-2021
 * @last modified by  : chayanbatabyal@gmail.com
**/
import { LightningElement, api, wire } from 'lwc';
import fetchLabel from '@salesforce/apex/Utilities.getDynamicCustomLabel';
export default class DynamicCustomLabel extends LightningElement {
	@api customLabelAPIName;
	customLabelValue;

	@wire(fetchLabel, { labelToFetch: '$customLabelAPIName' })
	wiredData({ error, data }) {
		if (data) {
			this.customLabelValue = data;
		}
		else if (error) {
			console.error('Error:', error);
		}
	}
}