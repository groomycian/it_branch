﻿require 'spec_helper'

describe "Teacher pages" do

	subject { page }

  describe "profile page" do
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { visit teacher_path(teacher) }

    it { should have_selector('h1',    text: teacher.name) }
    it { should have_selector('title', text: teacher.name) }
  end

  describe "signup page" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a teacher" do
        expect { click_button submit }.not_to change(Teacher, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example Teacher"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a teacher" do
        expect { click_button submit }.to change(Teacher, :count).by(1)
      end
    end
  end

  describe "edit" do
    let(:teacher) { FactoryGirl.create(:teacher) }
    before { visit edit_teacher_path(teacher) }

    describe "page" do
      it { should have_selector('h1',    text: "Изменение данных профиля") }
      it { should have_selector('title', text: "Редактирование профиля") }
      it { should have_link('изменить', href: 'http://gravatar.com/emails') }
    end

    describe "with invalid information" do
      before { click_button "Сохранить" }

      it { should have_content('ошибка') }
    end
  end
end