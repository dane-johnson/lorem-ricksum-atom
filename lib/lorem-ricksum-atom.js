'use babel';

import LoremRicksumAtomView from './lorem-ricksum-atom-view';
import { CompositeDisposable } from 'atom';

export default {

  loremRicksumAtomView: null,
  modalPanel: null,
  subscriptions: null,

  activate(state) {
    this.loremRicksumAtomView = new LoremRicksumAtomView(state.loremRicksumAtomViewState);
    this.modalPanel = atom.workspace.addModalPanel({
      item: this.loremRicksumAtomView.getElement(),
      visible: false
    });

    // Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    this.subscriptions = new CompositeDisposable();

    // Register command that toggles this view
    this.subscriptions.add(atom.commands.add('atom-workspace', {
      'lorem-ricksum-atom:toggle': () => this.toggle()
    }));
  },

  deactivate() {
    this.modalPanel.destroy();
    this.subscriptions.dispose();
    this.loremRicksumAtomView.destroy();
  },

  serialize() {
    return {
      loremRicksumAtomViewState: this.loremRicksumAtomView.serialize()
    };
  },

  toggle() {
    console.log('LoremRicksumAtom was toggled!');
    return (
      this.modalPanel.isVisible() ?
      this.modalPanel.hide() :
      this.modalPanel.show()
    );
  }

};
